class SessionsController < ApplicationController
  skip_authorization_check

  def new
  end

  def create
    # Ref: http://robb.weblaws.org/2013/12/05/yes-rails-supports-case-insensitive-database-queries/
    # Ref: http://stackoverflow.com/a/9574674
    # Authenticate with case insensitive email or cell_phone_number
    #user = User.find_by_email(params[:identifier]) || User.find_by_cell_phone_number(params[:identifier])
    user = User.where(User.arel_table[:email].matches(params[:identifier])).first || User.where(User.arel_table[:cell_phone_number].matches(params[:identifier])).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = t("controllers.sessions_controller.actions.create.success")
      redirect_back_or_default root_path
    else
      flash.now[:error] = t("controllers.sessions_controller.actions.create.error")
      render "new"
    end
  end

  def destroy
    if current_user
      session[:user_id] = nil
      flash[:success] =  t("controllers.sessions_controller.actions.destroy.success")
    end
    redirect_to sign_in_path
  end
end
