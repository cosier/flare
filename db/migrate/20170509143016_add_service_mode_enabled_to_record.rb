class AddServiceModeEnabledToRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :service_mode_enabled, :boolean, default: false
  end
end
