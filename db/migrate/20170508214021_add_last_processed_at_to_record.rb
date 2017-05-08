class AddLastProcessedAtToRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :last_processed_at, :datetime
  end
end
