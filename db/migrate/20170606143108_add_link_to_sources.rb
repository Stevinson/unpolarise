class AddLinkToSources < ActiveRecord::Migration[5.0]
  def change
    add_reference :sources, :link, foreign_key: true
  end
end
