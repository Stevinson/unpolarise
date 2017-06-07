class Link < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :source
  # Validations
  # validates :url, presence: true, allow_blank: false, url: true # Ensure it has a valid url
  validates :url, presence: true
end
