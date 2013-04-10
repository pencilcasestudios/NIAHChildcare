class FamilyProfilesController < ApplicationController
  before_filter :sign_in_required

  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
    @family_profile.addresses.build(email: current_user.email, phone: current_user.cell_phone_number)
    @family_profile.children.build
    @family_profile.guardians.build(full_name: current_user.full_name)
    #@family_profile.references.build
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

  def edit
  end

  def update
    if @family_profile.update_attributes(params[:family_profile])
      flash[:success] = t("controllers.family_profiles_controller.actions.update.success")
      redirect_to @family_profile
    else
      render action: "edit"
    end
  end
end
