class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  private

  # Find the article by its ID
  def set_article
    @article = Article.find(params[:id])
  end
end
