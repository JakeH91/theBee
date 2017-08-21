class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id
    can :manage, Comment, user_id: user.id
    can :read, :all
    if user.admin?
    	can :manage, :all
      can :destroy, Product
    end
  end
end
