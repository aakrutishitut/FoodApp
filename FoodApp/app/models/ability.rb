# specifies access to different type of users
class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all # permissions for every user, even if not logged in
    if user.typeofu == 'restaurant'
      can :manage, Restaurant
      can :manage, MenuItem
    else
      can :manage, Order
      can :manage, Current
      can :manage, Item
    end
  end
end
