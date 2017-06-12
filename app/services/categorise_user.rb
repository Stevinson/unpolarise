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

  # Create a hash of the number of likes for each page
  def create_likes_hash
    # Iterate over each page and get number of friend's likes from FB
    Page.all.each do |page|
      url = "www.mbasic.facebook.com/#{page.url}/socialcontext"
      count = JS(url)
      likes_info = {}
      likes_info[page.name.to_sym] = count
    end
    return likes_info
  end

  # Calculate the likes_score as an aggregate of the user's friends' likes scores
  def calculate_likes_score(likes_info)
    score = 0
    # Iterate over the
    likes_info.each do |key, value|
      # Get access to the political score of each page
      val = Page.where(name: key).source_score
      score += val.to_f * value
    end
    return score
  end
end
