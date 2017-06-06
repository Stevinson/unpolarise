class Link < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :sources
  # Validations
  # validates :url, presence: true, allow_blank: false, url: true # Ensure it has a valid url
  validates :url, presence: true
end
