class Article < ApplicationRecord
  # Each article is to have one image
  has_attachment :photo

  # This part is for the configuration of Rails Admin, so that we can upload an image with Attachinary.
  rails_admin do
    edit do
      field :title
      field :url
      field :summary
      field :photo do
        partial 'direct_image_upload'
      end
    end
  end
end
