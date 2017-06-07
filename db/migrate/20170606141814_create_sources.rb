class CreateSources < ActiveRecord::Migration[5.0]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :url_base
      t.integer :source_score

      t.timestamps
    end
  end
end
