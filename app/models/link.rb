class Link < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :sources
  # Validations
  # It is a valid url
end
