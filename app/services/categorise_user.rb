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
    # Calculate the scores from the news sources
    @user_info[:source_score] = calculate_sources_score
    # Calculate the scores from the likes
    @user_info[:like_score] = calculate_likes_score
    # Calculate confidence score
    @user_info[:confidence] = calculate_dumb_confidence
    # Basic categorisation (for the data we have a nearest-neighbout/regression/SVM approach would be overkill and no correct)
    @user_info[:category] = (@user_info[:source_score] + @user_info[:like_score]) < 0 ? "right" : "left"
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
  def calculate_dumb_confidence
    # Simple 'confidence' metric
    source_confidence = @user.links.all.length / 100.0
    #  Temporarily have likes confidence = 0 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # likes_confidence = @user.likes.all.length / 100.0
    likes_confidence = 0
    confidence = (likes_confidence + source_confidence) / 200.0
    # The metric is {0,1} therefore limit
    return [confidence, 1].min
  end

  # Calculate the likes_score as an aggregate of the user's friends' likes scores
  def calculate_likes_score
    score = 0
    # Check that the user has like data
    if @user.like_info
      # Accumalate the number in each category to calculate like_score
      likes_hash = Hash.new(0)
      @user.like_data.each { |name, d| likes_hash[d["source_score"]] += 1 }
      likes_array = likes_hash.to_a
      likes_array.each do |score_num_pair|
        score += (score_num_pair[0].to_f * score_num_pair[1])
      end
    end
    return score
  end
end
