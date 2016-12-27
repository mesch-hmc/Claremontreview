require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { code: @course.code, credits: @course.credits, description: @course.description, instructor: @course.instructor, requirements: @course.requirements, term: @course.term, title: @course.title }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, code: @course.code
    assert_response :success
  end
end
