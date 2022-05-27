class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :manage, Operation, author_id: user.id
      can :manage, Category, user_id: user.id
      can :manage, Categorization, user_id: user.id
    end
  end
end
