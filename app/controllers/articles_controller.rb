class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  # The index is suggested articles, i.e. it only displays the active and correct
  # articles for the user's type
  def index
    # Mapping from a user to the articles we want to show them
    switch = { left: "right", right: "left" }
    # Get the mapped category
    display_class = switch[current_user.info[:category].to_sym]
    # Get the articles we want to show this specific user
    @articles = Article.where("active = ? AND category = ?", true, display_class)
    # Descriptions of each of the types
    @types = { right: "This is because most of the sources of the news have, on aggregate, come from more conservative sources", left: "This is because most of the sources of the news have, on aggregate, come from more liberal sources" }
  end

  def show
  end

  private

  # Find the article by its ID
  def set_article
    @article = Article.find(params[:id])
  end
end
