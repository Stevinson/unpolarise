class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(user: current_user, article_id: params[:article_id])
    @bookmark.save # Valid inputs
    respond_to do |format|
      format.js
    end
  end
end
