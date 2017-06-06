class Article < ApplicationRecord
  # Each article is to have one image
  has_attachment :photo
end
