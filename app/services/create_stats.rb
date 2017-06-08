# Service object that performs the business logic that creates manipulates
# the stats that are given to a user to display the data collected
# by the extension
class CreateStats

  # Constructor
  def initialize(user) # params
    # @user = params[:user]
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
    # Update a user's 'sources_stats'
    @user.sources_stats = @sources_stats
    @user.save
  end

  private

  # This is redundant - I will probably remove as can be done directly
  # Populate the news sources hash with the of count of how many matching links
  def populate_sources_stats
    # Iterate over each of a user's links, adding to the count of the corresponding source
    @user.links.all.each { |link| @sources_stats[link.source.name] += 1 }
  end

end
