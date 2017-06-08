# Service object that categorises a user into a class so we can push them certain articles
class CategoriseUser
  # Constructor
  def initialize(user)
    # @user = params[:user]
    @user = user # The user who the stats are for (which also gives access to links)
    @sources = Source.all
    @user_info = {}
  end

  # Perform the logic
  def perform
    # Calculate the score from the news sources
    @user_info[:source_score] = calculate_sources_score
    @user_info[:confidence] = calculate_confidence
    # Calculate the scores from any other data we collect
    # ...
    # Perform k-nearest or whatever algorithm we will use to categorise
    # ...
    # !! For now dumb implementation
    @user_info[:category] = @user_info[:source_score] < 0 ? "left" : "right"
    # Update a user's category
    @user.info = @user_info
    @user.save
  end

  private

  # Calculate the sources_score as an aggregate of each of a user's news source's scores
  def calculate_sources_score
    score = 0.0
    num_links = @user.links.all.length
    # Create a cumulative score for the sources
    @user.links.all.each { |link| score += link.source.source_score }
    return score.to_f / num_links
  end

  # Calculate a confidence score. This is just a number in the range {0,1}
  # which gives an idea of how many sources the categorisation is based on
  def calculate_confidence
    # Simple 'confidence' metric
    confidence = @user.links.all.length / 100.0
    # The metric is {0,1} therefore limit
    return [confidence, 1].min
  end
end
