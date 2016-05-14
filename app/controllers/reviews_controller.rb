class ReviewsController < ApplicationController
  before_action :get_review, only: [:destroy, :edit, :update, :upvote, :downvote]
  before_action :authenticate_user!, only: [:create, :upvote, :downvote]
  before_filter :create_info_param, only: [:create, :update]

  def create
    @course = Course.find_by_slug(params[:course_code])

    if one_review # make sure that the user on reviews a course once
      @review = @course.reviews.create(review_params)
      @review.user = current_user

      respond_to do |format|
        if @review.save
          # Send email notification to admin : Don't use in local
          # NewReviewNotification.notify(@review).deliver_later

          format.html { redirect_to @course, notice: 'Thank you for your review!' }
          format.json { render :show, status: :ok, location: @course }
        else
          format.html { redirect_to @course, notice: 'Invalid review' }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @course, notice: 'You have already reviewed this course' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @course, notice: 'Review updated' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render 'review/form' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if (current_user == @review.user || current_user.admin?)
      @review.destroy
    end
    @review.update_avg_rating
    redirect_to course_path(@course)
  end

  ### Voting ###
  def upvote
    if current_user.voted_up_on? @review
      @review.unliked_by current_user
    else
      @review.upvote_by current_user
    end
  end

  def downvote
    if current_user.voted_down_on? @review
      @review.undisliked_by current_user
    else
      @review.downvote_by current_user
    end
  end

  private
    def get_review
      @course = Course.find_by_slug(params[:course_code])
      @review = @course.reviews.find(params[:id])
    end

    def one_review
      return true if @course.reviews.empty?
      return @course.reviews.unscoped.where(user_id: :user_id).empty?
    end

    def create_info_param
      params[:review][:info] = 'Taken ' + params[:review][:semester].to_s + ' ' + params[:review][:year].to_s + ' | ' + params[:review][:other].first
    end

    def review_params
      params.require(:review).permit(:rank, :rating, :date, :info, :review_text, :course_id, :grade, :user_id, :semester, :year, :other)
    end
end
