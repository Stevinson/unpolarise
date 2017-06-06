# Controller that handles the parsing of the links from the Chrome extension.
# It gives the User class JSON files that can be used for the visualisation
# of the data
class LinksController < ApplicationController
  # Action that receives the post request made from the extension (containing
  # their FB user ID and the links found)
  def create(user_links_hash)
    # Iterate over each of the urls in user_links_hash[:links]
      # Check the url against each of the sources 'url_base'
      # If it matches then create a Links table entry
      # This table entry should have a reference to the source that it matched and the user that has the same
      #
  end
end
