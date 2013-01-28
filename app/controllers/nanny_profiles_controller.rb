class NannyProfilesController < ApplicationController
  before_filter :sign_in_required

  load_and_authorize_resource

  def new
    @nanny_profile.full_name = current_user.full_name
    @nanny_profile.addresses.build
    @nanny_profile.references.build
  end

  def create
    @nanny_profile.user = current_user
    if @nanny_profile.save
      flash[:success] = t("controllers.nanny_profiles_controller.actions.create.success")
      redirect_to root_path
    else
      render action: "new"
    end
  end
end
