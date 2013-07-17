class WelcomeController < ApplicationController
  before_filter :sign_out_required, only: [:register]

  skip_authorization_check

  def index
    if user_signed_in? && current_user.admin?
      @users = User.where("state='registered'")
      @users_size = @users.size

      # Get family profiles for registered users only
      @family_profiles = FamilyProfile.all(joins: :user, conditions: { users: {state: "registered"}})
      @family_profiles_size = @family_profiles.size

      # Get nanny profiles for registered users only
      @nanny_profiles = NannyProfile.all(joins: :user, conditions: { users: {state: "registered"}})
      @nanny_profiles_size = NannyProfile.all.size
    end
  end

  def about
  end

  def services_and_fees
  end

  def nannies
  end

  def register
  end

  def terms
  end

  def contact
  end
end
