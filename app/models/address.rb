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
end
