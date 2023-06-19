# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)
    if user.role == "admin"
      can :manage, JobPost
      can :read, JobApplication
      can :mark_as_seen, JobApplication
    else
      can :read, JobPost
      can :create, JobApplication

    end

  end
end
