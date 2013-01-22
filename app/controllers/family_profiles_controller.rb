class FamilyProfilesController < ApplicationController
  before_filter :sign_in_required

  load_and_authorize_resource

  def new
    @family_profile.addresses.build
    @family_profile.children.build
    @family_profile.guardians.build
    @family_profile.references.build
  end

  def create
    @family_profile.user = current_user
    if @family_profile.save
      flash[:success] = t("controllers.family_profiles_controller.actions.create.success")
      redirect_to root_path
    else
      render action: "new"
    end
  end
end
