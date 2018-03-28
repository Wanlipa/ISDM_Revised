class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard                  # allow access to dashboard
      can :manage, :all
    elsif user.member?
      can :read, Course
      can :create, Course
      can :update, Course do |course|
        course.try(:user) == user
      end
      can :destroy, Course do |course|
        course.try(:user) == user
      end
      can :manage, Course do |course|
        course.try(:user) == user
      end
    else
      can :read, :all
    end
  end
end
