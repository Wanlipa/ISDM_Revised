class WelcomeController < ApplicationController
  def index
    if current_user.present?
      if current_user.admin?
        @courses = Course.all
      else
        @user = current_user
        @courses = @user.courses.all
      end
    end
  end

  def preindex
    if current_user.present?
      if current_user.admin?
        @courses = Course.all
        @courses.each do |course|
          if (course.courseName.nil? || course.courseName.empty?)
            course.destroy
          end
        end
      else
        @user = current_user
        @courses = @user.courses.all
        @courses.each do |course|
          if (course.courseName.nil? || course.courseName.empty?)
            course.destroy
          end
        end
      end
    end
    redirect_to welcome_index_path
  end

  def summary
    @users = User.all
  end
end
