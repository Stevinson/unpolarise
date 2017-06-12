# Controller that handles the parsing of the links from the Chrome extension.
# It gives the User class JSON files that can be used for the visualisation
# of the data
class LinksController < ApplicationController
  # So that we can test, temporarily remove authentification
  skip_before_action :verify_authenticity_token

  # Action that receives the post request made from the extension (containing
  # their FB name and the links found)

  def create
    # Get the user name and links that have been sent from the extension
    name = params[:name] # received as a string [to be checked]
    urls = params[:urls] # received as an array
    # urls = urls.gsub(/[\[\]]/, '').split(', ') # Just for testing with Postman
    # Find the corresponding user
    user = User.find_by(name: name)
    # Get access to all the sources
    sources = Source.all
    # Iterate over each of the urls if links received
    if urls
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
  end
end
