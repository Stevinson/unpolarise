class AddStatusAndCategoryToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :status, :string
    add_column :articles, :category, :string
  end
end
