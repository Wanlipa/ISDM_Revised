class CourseController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource

  def index
    @user = current_user
    if current_user.admin?
      @courses = Course.all
    else
      @courses = @user.courses.all
    end
    if @courses.empty?
      redirect_to welcome_index_path
    end
  end

  # delete created course that has no course name specified.
  def check
    @course = Course.find(params[:id])
    if @course.courseName.nil? || @course.courseName.empty?
      @course.destroy
    end
    redirect_to welcome_index_path
  end

  def show
    @course = Course.find(params[:id])
    @check = @course.avatar.file.nil?

    if current_user.admin?
      @courses = Course.all
    end
  end

  def destroy
    @user = current_user
    # @course = @user.courses.find(params[:id])
    # @course.destroy

    @courses = @user.courses.all
    if @courses.empty?
      redirect_to welcome_index_path
    else
      redirect_to course_index_path(@course)
    end

    if current_user.admin?
      @course = Course.find(params[:id])
      @course.destroy
      flash[:success] = "Course successfully destroy"
    else
      @course = @user.courses.find(params[:id])
      @course.destroy
      flash[:success] = "Course successfully destroy"
    end
  end

  def course_syllabus
    # @user = current_user
    # @course = @user.courses.find(params[:id])
    @course = Course.find(params[:course_id])
    render pdf: "Course_Syllabus",
           :template => "course/course_syllabus.html.erb",
           :page_size => "A4",
           encoding: "UTF-8"
  end

  def course_syllabus_instructor
    @course = Course.find(params[:course_id])
    render pdf: "Course_Syllabus",
           :template => "course/course_syllabus_instructor.html.erb",
           :page_size => "A4",
           encoding: "UTF-8"
  end
end
