class AddInfoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :info, :text
  end
end
