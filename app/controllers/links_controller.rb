# Controller that handles the parsing of the links from the Chrome extension.
# It gives the User class JSON files that can be used for the visualisation
# of the data
class LinksController < ApplicationController
  # So that we can test, temporarily remove authentification
  skip_before_action :verify_authenticity_token

  # Action that receives the post request made from the extension (containing
  # their FB user ID and the links found)
  def create
    # Get the user ID and urls that have been sent from the extension
    id = params[:uid]
    urls_string = params[:urls]
    # Turn the urls which are currently a string, into an array
    urls = urls_string.gsub(/[\[\]]/, '').split(', ')
    # Find the user from facebook_id
    user = User.find_by(uid: id)
    # (I don't think we need a case when the user is not found as this is checked extension side?)
    # Get access to all the sources
    sources = Source.all
    # Iterate over each of the urls in user_links_hash[:links]
    urls.each do |url|
      # Check the url against each of the sources 'url_base'
      sources.each do |source|
        # If it matches then create a Links table entry with reference to the source and user matched
        if url.include? source.url_base
          Link.create!(url: url, user: user, source: source)
        end
      end
    end
  end

  # Create stats from the data in the links DB for
  def create_user_stats
    # Every so often a JSONb file should be created and given to the 'users' table

    # The first stats are a hash with the number of urls (value) from each site (key)

    # Create other JSONb's for the other visualisations
  end
end
