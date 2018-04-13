class CourseStepsController < ApplicationController
  skip_before_action :verify_authenticity_token
  include Wicked::Wizard
  steps :about_course, :topics, :instructors, :course_meta, :objectives, :targets, :outcomes, :problems_solutions, :chapters, :evaluation

  def show
    @user = current_user
    if current_user.admin?
      flash[:error] = "Admin can edit at Admin Dashboard."
      redirect_to welcome_index_path
    else
      @course = @user.courses.find(params[:course_id])
      render_wizard
    end
  end

  def update
    @user = current_user
    @course = @user.courses.find(params[:course][:course_id])
    params[:course][:status] = 'active' if step == steps.last
    if @course.update_attributes(course_params)
      if step == steps.last
        flash[:success] = "Your course has been updated !"
        redirect_to course_index_path(@course)
      else
        redirect_to wizard_path(next_step, :course_id => @course.id)
      end
    else
      flash[:error] = "Course name cannot be empty."
      redirect_to wizard_path(steps.first, :course_id => @course.id)
    end
  end

  def create
    if current_user.admin?
      flash[:error] = "Admin can edit at Admin Dashboard."
      redirect_to welcome_index_path
    else
      @user = current_user
      @course = @user.courses.create(:category_id => 1)
      @course.outcomes.build
      @course.outcomes.each do |o|
        o.techniques.build
      end
      redirect_to wizard_path(steps.first, :course_id => @course.id)
    end
  end

  private
    def course_params
      params.require(:course).permit(:courseName, :about_course,
                                     :effort, :price, :institution, :subject, :level, :languages, :evaluation,
                                     :videots, :prerequisites, :avatar, :status, :category_id,
                                     topics_attributes: [:id, :name, :_destroy],
                                     instructors_attributes: [:id, :name, :avatar, :_destroy],
                                     targets_attributes: [:id, :name, :_destroy],
                                     outcomes_attributes: [:id, :outcome, :_destroy, techniques_attributes: [:id, :name, :_destroy]],
                                     techniques_attributes: [:id, :name, :_destroy],
                                     objectives_attributes: [:id, :objective, :technique, :_destroy],
                                     problem_solutions_attributes: [:id, :problem, :solution, :_destroy],
                                     chapters_attributes: [:id, :name, :start, :end, :_destroy])
    end
end
