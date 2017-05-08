# == Schema Information
#
# Table name: records
#
#  id                :integer          not null, primary key
#  domain            :string
#  zone              :string
#  key_id            :integer
#  record_data       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  last_processed_at :datetime
#  status            :integer          default(0)
#

class Record < ApplicationRecord
  belongs_to :key
  enum status: [:enabled, :disabled, :error]
  serialize :record_data, Hash

  validates_presence_of :key
  validates_presence_of :domain
  validates_presence_of :zone

  def self.install(d, z, k)
    unless where(domain: d, zone: z).first.present?
      create!(domain: d, zone: z, key: k)
    end
  end

  def label
    "#{zone}.#{domain}"
  end

  def process!

    if rec && rec['rec_id'].present?
      id = rec['rec_id']
      log "updating existing rec: #{id} -> #{domain} / #{label} / #{latest_ip}"
      api.rec_edit(domain, "A", id, label, latest_ip, 300)
    else
      log "creating new rec"
      api.rec_new(domain, "A", label, latest_ip, 300)
    end

    self.last_processed_at = DateTime.now
    save! if changed?
  end

  def all_records
    api.rec_load_all(domain)['response']['recs']['objs']
  end

  def rec
    @_rec ||= all_records.select do |rec|
      rec['name'] == label && rec['type'] == 'A'
    end.first

    self.record_data = @_rec || {}
    @_rec

  rescue StandardError => e
    Event.create(title: e.message, description: e.stacktrace.to_json, level: :error)
    false
  end

  def api
    @api ||= CloudFlare::connection(key.value, key.email_address)
  end

  private

  def latest_ip
    @latest_ip ||= Address.order(updated_at: :desc).first.ip_address
  end

  def log(title)
    Event.create!(title: "#{label} : #{title}")
  end
end
