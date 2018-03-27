class CourseController < ApplicationController
  def index
    @user = current_user
    @courses = @user.courses.all
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
    redirect_to course_index_path
  end

  def show
    @course = Course.find(params[:id])
    @check = @course.avatar.file.nil?
  end

  def destroy
    @user = current_user
    @course = @user.courses.find(params[:id])
    @course.destroy

    @courses = @user.courses.all
    if @courses.empty?
      redirect_to welcome_index_path
    else
      redirect_to course_index_path(@course)
    end
  end

  def course_syllabus
    @course = Course.find(params[:course_id])
    render pdf: "Course_Syllabus",
           :template => "course/course_syllabus.html.erb",
           :page_size => "A4",
           encoding: "UTF-8"
  end
end
