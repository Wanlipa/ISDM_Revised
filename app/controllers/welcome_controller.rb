class WelcomeController < ApplicationController
  def index
    if current_user.nil? == false
      @user = current_user
      @courses = @user.courses.all
    end
  end

  def summary
    @users = User.all
  end
end
