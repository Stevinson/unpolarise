class ChangeSourceScoreToFloat < ActiveRecord::Migration[5.0]
  def change
    remove_column :sources, :source_score
    add_column :sources, :source_score, :float
  end
end
