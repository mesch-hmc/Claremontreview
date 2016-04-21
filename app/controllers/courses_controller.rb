class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @courses = Course.search(params[:query])
    else
      @courses = Course.all
    end
  end

  def show
      @course = Course.find_by_slug(params[:code])
      @reviews = @course.reviews
  end

  def new
    redirect_to courses_url # don't allow people to hit new
  end

  def edit
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

  def autocomplete
    render json: Course.search(params[:query], {
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
      params.require(:course).permit(:code, :title, :instructor, :credits, :description, :requirements, :term, :slug)
    end
end
