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

require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
