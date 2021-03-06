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
    likes_hash = params["likes_array"].to_unsafe_h.to_hash
    likes_hash.each { |hash, data| data["friend_likes"] = data["friend_likes"].to_i }
    # Find the corresponding user
    user = User.find_by(name: name)
    # binding.pry
    # Iterate over each of the hashes if received something
    if likes_hash
      # binding.pry
      user.like_data = likes_hash
      user.save
    end
  end
end
