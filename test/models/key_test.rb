# == Schema Information
#
# Table name: keys
#
#  id            :integer          not null, primary key
#  key_type      :integer          default(0)
#  name          :string           not null
#  value         :string           not null
#  data          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  email_address :string
#

require 'test_helper'

class KeyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
