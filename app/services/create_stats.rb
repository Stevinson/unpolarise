# Service object that is run every X hours to perform the business logic that
# creates the JSONb files that are given to a user to display the data collected
# by the extension
class CreateStats

  # Constructor
  def initialize(user) # params
    # @user = params[:user]
    # @links = params[:links]
    @user = user # The user who the stats are for (which also gives access to links)
    @sources = Source.all
    # Create a hash in which the keys are the news sources
    @sources_stats = Hash.new(0)
    @sources.all.each { |source| @sources_stats[source.name] }
  end

  # Perform work
  def perform
    # Populate the hash with the relevant data
    populate_sources_stats
    @user.sources_stats = @sources_stats
    @user.save
    # Return result
    # return @sources_stats
  end

  private

  # Populate the news sources hash with the of count of how many matching links
  def populate_sources_stats
    # Iterate over each of a user's links, adding to the count of the corresponding source
    @user.links.all.each { |link| @sources_stats[link.source.name] += 1 }
  end

  # Write the hash into a JSON
  def hash_to_json
  end

end

###
# QUESTIONS
###

# 1. Do we just want to add to the stats or do we want to create the whole JSON again?
