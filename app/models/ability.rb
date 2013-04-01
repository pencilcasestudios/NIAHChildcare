class Ability
  include CanCan::Ability

  def initialize(user)
    # Guests (not logged in)
    user ||= User.new

    # Users
    can :manage, FamilyProfile, id: user.id
    can :manage, NannyPortrait, family_profile: { user_id: user.id }
    can :manage, NannyProfile, id: user.id
    can :manage, Note, id: user.id
    can :manage, User, id: user.id

    # Administrators
    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end
  end
end
