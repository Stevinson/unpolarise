# Controller that handles the parsing of the links from the Chrome extension.
# It gives the User class JSON files that can be used for the visualisation
# of the data
class LinksController < ApplicationController
  # So that we can test, temporarily remove authentification
  skip_before_action :verify_authenticity_token

  # Action that receives the post request made from the extension (containing
  # their FB user ID and the links found)
  def create

    binding.pry

    id = params[:]
    urls = params[:]

    # First find user from facebook_id

    # Iterate over each of the urls in user_links_hash[:links]
      # Check the url against each of the sources 'url_base'
      # If it matches then create a Links table entry
      # This table entry should have a reference to the source that it matched and the user that has the same
  end

  # Create stats from the data in the links DB for
  def create_user_stats
    # Every so often a JSONb file should be created and given to the 'users' table

    # The first stats are a hash with the number of urls (value) from each site (key)

    # Create other JSONb's for the other visualisations
  end
end
