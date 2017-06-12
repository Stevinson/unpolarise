class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end

  def about
  end

  def how_to_use
  end

  def analytics
  end

  def suggested_articles
  end
end
