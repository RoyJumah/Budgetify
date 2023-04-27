class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, Asset, authorid: user.id
    can :manage, Group, authorid: user.id
  end
end
