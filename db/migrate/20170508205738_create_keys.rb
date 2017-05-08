class CreateKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :keys do |t|
      t.integer :key_type, default: 0
      t.string :name, null: false
      t.string :value, null: false

      t.text :data
      t.timestamps
    end
  end
end
