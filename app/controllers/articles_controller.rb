class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  # The index is suggested articles, i.e. it only displays the active and correct
  # articles for the user's type
  def index
    # @articles = Article.where("active = ? AND user = ?", true, )
    # For now display all articles
    @articles = Article.all
  end

  def show
  end

  private

  # Find the article by its ID
  def set_article
    @article = Article.find(params[:id])
  end
end
