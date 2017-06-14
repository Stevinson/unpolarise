class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :user, presence: true
  validates :article, presence: true
end
