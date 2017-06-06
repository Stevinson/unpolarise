class RemoveLinkFromSources < ActiveRecord::Migration[5.0]
  def change
    remove_reference :sources, :link, foreign_key: true
  end
end
