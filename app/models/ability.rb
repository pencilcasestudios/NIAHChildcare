class Ability
  include CanCan::Ability

  def initialize(user)
    # Guests (not logged in)
    user ||= User.new

    # Users
    can :manage, User, id: user.id

    # Family Profiles
    can :manage, FamilyProfile, id: user.id

    # Nanny Portrait
    can :manage, NannyPortrait, id: user.id

    # Nanny Profile
    can :manage, NannyProfile, id: user.id
  end
end
