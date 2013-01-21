class Ability
  include CanCan::Ability

  def initialize(user)
    # guest user (not logged in)
    user ||= User.new

    # Application users
    can :manage, User, id: user.id
  end
end
