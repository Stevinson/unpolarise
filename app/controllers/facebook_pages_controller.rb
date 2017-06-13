# Controller that handles the parsing of the likes from the Chrome extension.
# It updates the User info that can be used for the visualisation
# of the data
class FacebookPagesController < ApplicationController
  # So that we can test, temporarily remove authentification
  skip_before_action :verify_authenticity_token

  # Action that receives the post request made from the extension (containing
  # their FB user ID and the links found)

  def create
    # Get the user ID and links that have been sent from the extension
    name = params["name"] # String which is the user's name
    likes_array = params["likes_array"].to_h # Receives an array of hashes
    # Find the corresponding user
    user = User.find_by(first_name: name)
    # binding.pry
    # Iterate over each of the hashes if received something
    if likes_array
      # binding.pry
      user.like_data = likes_array
      user.save
    end
  end
end


#ultrahook
