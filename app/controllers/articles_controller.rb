class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def edit
  end

  def destroy
    @article.destroy
  end

  private

  # Whitelist and return a hash of the params required
  def article_params
    params.require(:article).permit(:title, :summary, :url) # :photo
  end

  # Find the article by its ID
  def set_article
    @article = Article.find(params[:id])
  end
end
