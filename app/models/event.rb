# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  level       :integer          default("debug")
#  description :text
#  data        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
  enum level: [:debug, :warning, :error, :info, :critical]

  def label
    "#{created_at}: #{title}#{description.present? ? ' :  ' + description : '' }"
  end
end
