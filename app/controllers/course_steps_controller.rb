class CourseStepsController < ApplicationController
  skip_before_action :verify_authenticity_token
  include Wicked::Wizard
  steps :about_course, :topics, :instructors, :course_meta

  def show
    @user = current_user
    @course = @user.courses.find(params[:course_id])
    render_wizard
  end

  def update
    @user = current_user
    @course = @user.courses.find(params[:course][:course_id])
    @course.update_attributes(course_params)
    if step == steps.last
      redirect_to course_index_path(@course)
    else
      redirect_to wizard_path(next_step, :course_id => @course.id)
    end
  end

  def create
    @user = current_user
    @course = @user.courses.create
    redirect_to wizard_path(steps.first, :course_id => @course.id)
  end

  private
    def course_params
      params.require(:course).permit(:courseName, :about_course, :topics, :instructors, :length,
                                     :effort, :price, :institution, :subject, :level, :languages, :videots, :prerequisites, :avatar)
    end
end
