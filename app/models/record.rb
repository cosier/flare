# == Schema Information
#
# Table name: records
#
#  id          :integer          not null, primary key
#  domain      :string
#  zone        :string
#  key_id      :integer
#  record_data :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Record < ApplicationRecord
end
