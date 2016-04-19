class ReviewsController < ApplicationController
    before_action :authenticate_user!, only: [:create]
    
    def create
        @course = Course.find_by_slug(params[:course_code])
        @review = @course.reviews.create(review_params)

        redirect_to course_path(@course)
    end

    private
      def review_params
          params.require(:review).permit(:rank, :rating, :date, :info, :review_text, :course_id, :grade)
      end
end
