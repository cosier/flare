class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.integer :level, default: 0

      t.text :description
      t.text :data

      t.timestamps
    end
  end
end
