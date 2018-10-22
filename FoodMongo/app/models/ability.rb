class Ability
  include CanCan::Ability

   def initialize(user) # permissions for every user, even if not logged in
    if user.nil?
      can :read, Restaurant
    else
      if user.type_of_u == 'restaurant'
        can :manage, Owners
        can :manage, MenuItem
        can :delete, Order
        can :delete, Item
        can :manage, Order
        can :read, Restaurant
      else
        can :manage, Review
        can :manage, Restaurant
        can :manage, Order
        can :manage, Cart
        can :manage, Item
      end
    end
  end
end
