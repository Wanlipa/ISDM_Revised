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

  def summary
    @users = User.all
  end
end
