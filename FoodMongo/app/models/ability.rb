class Ability
  include CanCan::Ability

   def initialize(user) # permissions for every user, even if not logged in
    if user.nil?
      can :read, Restaurant
    else
      can :manage, Restaurant
    # if user.type_of_u == 'restaurant'
    #   can :manage, Owners::Restaurant
    #   can :manage, MenuItem
    # else
    #   can :manage, Restaurant
    #   can :manage, Order
    #   can :manage, Cart
    #   can :manage, Item
    # end
  end
  end
end
