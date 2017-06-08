class ChangeStatusToBoolean < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :status
    add_column :articles, :active, :boolean, default: false
  end
end
