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
#

class Record < ApplicationRecord
  belongs_to :key

  def self.install(d, z, k)
    unless where(domain: d, zone: z).first.present?
      create!(domain: d, zone: z, key: k)
    end
  end

  def label
    "#{zone}.#{domain}"
  end
end
