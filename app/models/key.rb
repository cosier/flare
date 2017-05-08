# == Schema Information
#
# Table name: keys
#
#  id            :integer          not null, primary key
#  key_type      :integer          default("cloudflare")
#  name          :string           not null
#  value         :string           not null
#  data          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  email_address :string
#

class Key < ApplicationRecord
  enum key_type: [:cloudflare]
  has_many :records, dependent: :destroy

  def label
    "#{name}:#{value}"
  end
end
