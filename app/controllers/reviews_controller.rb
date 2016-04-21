class ReviewsController < ApplicationController
  before_action :get_review, only: [:destroy, :edit, :update]
  before_action :authenticate_user!, only: [:create]

  def create
      @course = Course.find_by_slug(params[:course_code])
      @review = @course.reviews.create(review_params)
      @review.user = current_user

      respond_to do |format|
        if @review.save
          format.html { redirect_to @course, notice: 'Thank you for your review!' }
        else
          format.html { redirect_to @course, notice: 'Invalid review' }
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
    if current_user == @review.user
      @review.destroy
    end

    redirect_to course_path(@course)
  end

  private
    def get_review
      @course = Course.find_by_slug(params[:course_code])
      @review = @course.reviews.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:rank, :rating, :date, :info, :review_text, :course_id, :grade, :user_id)
    end
end
