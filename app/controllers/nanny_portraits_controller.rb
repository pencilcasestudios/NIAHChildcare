class NannyPortraitsController < ApplicationController
  before_filter :sign_in_required

  load_and_authorize_resource

  def new
    @nanny_portrait.references.build
  end

  def create
    if @nanny_portrait.save
      flash[:success] = t("controllers.nanny_portraits_controller.actions.create.success")
      redirect_to root_path
    else
      render action: "new"
    end
  end
end
