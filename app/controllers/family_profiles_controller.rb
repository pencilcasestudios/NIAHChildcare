class FamilyProfilesController < ApplicationController
  before_filter :sign_in_required

  load_and_authorize_resource

  def new
    @family_profile.guardians.build
  end
end
