class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id
    if user.admin?
    	can :manage, :all
    	can :destroy, [Comment, Product]
    else
    	can :read, :all
    	cannot :destroy, [Comment, Product]
    end
  end
end
