class AddSourceToLinks < ActiveRecord::Migration[5.0]
  def change
    add_reference :links, :source, foreign_key: true
  end
end
