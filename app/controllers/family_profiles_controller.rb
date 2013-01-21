class FamilyProfilesController < ApplicationController
  before_filter :sign_in_required

  load_and_authorize_resource

  def new
    @family_profile.guardians.build
    @family_profile.children.build
  end
end
