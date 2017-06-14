class BookmarksController < ApplicationController
  def create
    @article = Article.find(params[:id])
    @user = current_user
    @bookmark = Bookmark.new(user: @user, article: @article)
    iff @review.save # Valid inputs
      respond_to do |format| # Get input from html or js
        format.html { redirect_to article_path(@article) }
        format.js
      end
    else # Invalid inputs
      respond_to do |format| # Get input from html or js
        format.html { render "articles/show" }
        format.js
      end
  end
end
