class AddEmailToKeys < ActiveRecord::Migration[5.0]
  def change
    add_column :keys, :email_address, :string
  end
end
