# The model of a news source. Each source is categorised as 'left', 'centre_left',
# 'centre_right' or 'right', each of which has a 'source_score'
class Source < ApplicationRecord
  # Relationships
  has_many :links
  # Validate fields to ensure each source has the required fields
  validates :source_score, :inclusion => { :in => -1..1 } # Score is between -1 and 1 inclusive
  validates :name, presence: true # Name exists
  validates :url_base, presence: true # URL exists
end
