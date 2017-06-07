class AddSourcesStatsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sources_stats, :text
  end
end
