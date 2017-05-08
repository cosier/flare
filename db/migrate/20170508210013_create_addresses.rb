class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :ip_address, null: false
      t.timestamps
    end
  end
end
