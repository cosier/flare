class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :domain
      t.string :zone
      t.integer :key_id
      t.text :record_data

      t.timestamps
    end
  end
end
