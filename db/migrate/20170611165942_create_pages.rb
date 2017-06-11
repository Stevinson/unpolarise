class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :name
      t.string :url_component
      t.float :source_score

      t.timestamps
    end
  end
end
