class WelcomeController < ApplicationController
  before_filter :sign_out_required, only: [:register]

  skip_authorization_check

  def index
    if user_signed_in? && current_user.admin?
      @users = User.all
      @users_size = User.all.size

      @family_profiles = FamilyProfile.all
      @family_profiles_size = FamilyProfile.all.size

      @nanny_profiles = NannyProfile.all
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
