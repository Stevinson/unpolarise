class Page < ApplicationRecord
  # Relationships
  # has_many :likes
  # Validate fields to ensure each source has the required fields
  validates :source_score, :inclusion => { :in => -1..1 } # Score is between -1 and 1 inclusive
  validates :name, presence: true # Name exists
  validates :url_component, presence: true # URL exists
end
