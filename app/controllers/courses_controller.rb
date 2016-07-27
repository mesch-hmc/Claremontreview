class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  autocomplete :course, :code_title_instructor, :full => true, :limit => 100, :extra_data => [:code, :title], :display_value => :full_title

  def index
    if params[:query].present?
      @courses = Course.search("".html_safe + params[:query])
    else
      @courses = Course.all.order(:id)
    end
  end

  def show
    @reviews = @course.reviews
  end

  def new
    redirect_to courses_url # don't allow people to hit new
  end

  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def recent_reviews
    @course = Course.find_by_code(params[:course_code])
    @reviews = @course.reviews
    respond_to do |format|
      format.js
    end
  end

  def popular_reviews
    @course = Course.find_by_code(params[:course_code])
    @reviews = @course.reviews
    respond_to do |format|
      format.js
    end
  end

  def autocomplete
    render json: Course.search(("".html_safe + params[:query]), {
      fields: ["code", "title"],
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:code)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find_by_slug(params[:code])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:code, :title, :instructor, :credits, :description, :requirements, :term, :slug, :avg_rating)
    end
end
