# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user.admin?
      can :manage, JobPost
      can :read, JobApplication
    else
      can :read, JobPost
      can :create, JobApplication
    end

  end
end
