class RenameFeedsToLinks < ActiveRecord::Migration[5.0]
  def change
    rename_table :feeds, :links
  end
end
