class AddLikeDataToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :like_data, :text
  end
end
