class AddSourceToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :source, :string
  end
end
