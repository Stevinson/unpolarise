# Service object that is run every X hours to perform the business logic that
# creates the JSONb files that are given to a user to display the data collected
# by the extension
class CreateStats

  # Constructor
  # Accept input
  def initialise(params)
    # Class instances with @sign
    @user = params[:user]
    @links = params[:links]
    @sources = Source.all

  end

  # Perform work
  def perform
    # Create a hash to store the info
    # Populate the hash with the relevant data
    # Turn into
  end

  # Different methods for each of the JSONb's

  # Return result

  private

  # Create a hash with the relevant keys
  def
  end

  # Method that creates a hash from the DB
  def
  end

  # Write the hash into a JSON
  def
  end

end

###
# QUESTIONS
###

# 1. Do we just want to add to the stats or do we want to create the whole JSON again?
