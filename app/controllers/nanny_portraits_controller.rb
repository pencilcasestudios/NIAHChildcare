class NannyPortraitsController < ApplicationController
  before_filter :sign_in_required
  #before_filter :load_family_profile

  load_and_authorize_resource

  def show
  end

  def new
    @family_profile = FamilyProfile.find(params[:family_profile_id])
    @nanny_portrait = @family_profile.nanny_portraits.new
    #@nanny_portrait.references.build
  end

  def create
    @family_profile = FamilyProfile.find(params[:family_profile_id])
    @nanny_portrait = NannyPortrait.new(params[:nanny_portrait])
    @nanny_portrait = @family_profile.nanny_portraits.new(params[:nanny_portrait])

    if @nanny_portrait.save
      flash[:success] = t("controllers.nanny_portraits_controller.actions.create.success")
      redirect_to root_path
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @nanny_portrait.update_attributes(params[:nanny_portrait])
      flash[:success] = t("controllers.nanny_portraits_controller.actions.update.success")
      redirect_to @nanny_portrait
    else
      render action: "edit"
    end
  end

#private
#
#  def load_family_profile
#    @family_profile = FamilyProfile.find(params[:family_profile_id])
#  end
end
