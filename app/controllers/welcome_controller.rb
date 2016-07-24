class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: [:my_reviews]

  def index
  end

  def my_reviews
    @reviews = current_user.reviews.reorder("cached_votes_score DESC")
    if params[:recents] == 'true'
      @reviews = @reviews.reorder("created_at DESC")
    end
  end
end
