# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  ip_address :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ApplicationRecord
  def self.current
    last = Address.order(created_at: :desc).first
    current_ip = Ipify.ip

    if !last || last.ip_address != current_ip
      Address.create!(ip_address: current_ip)
    end

    current_ip
  end

  def label
    "#{ip_address}:#{created_at}"
  end
end
