class UsersController < ApplicationController
  before_filter :sign_in_required, except: [:new, :create]
  before_filter :sign_out_required, only: [:new, :create]
  before_filter :admin_required, only: [:index]

  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
    if params[:query] && params[:query].in?(["family","nanny"])
      session[:registration_type] = params[:query]
    else
      redirect_to register_path
    end
  end

  def create
    if @user.save_with_captcha
      # Email the user
      #Emailer.delay.registration_confirmation(@user)

      # Email the admin
      Emailer.delay.notify_admins_of_new_user_registration(@user)

      flash[:success] = t("controllers.users_controller.actions.create.success")
      redirect_to sign_in_path
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:success] = t("controllers.users_controller.actions.update.success")
      redirect_to(@user)
    else
      render action: "edit"
    end
  end
end
