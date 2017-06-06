class Source < ApplicationRecord
  # Relationships
  has_many :links
  # Validations
  # Name exists
  # URL exists
  # Score is between -1 and 1 inclusive
end
