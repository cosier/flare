class AddStatusToRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :status, :integer, default: 0
  end
end
