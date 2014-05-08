class PasswordResetsController < ApplicationController
  skip_authorization_check

  def new
  end

  def create
		user = User.where(User.arel_table[:email].matches(params[:identifier])).first #|| User.where(User.arel_table[:cell_phone_number].matches(params[:identifier])).first

		if user
			# Email the user
			user.send_password_reset
			flash[:success] = t("controllers.password_resets_controller.actions.create.success")
			redirect_to sign_in_path
		else
			flash[:error] = t("controllers.password_resets_controller.actions.create.error")
			redirect_to sign_in_path
		end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

	def update
		@user = User.find_by_password_reset_token!(params[:id])
		if @user.password_reset_sent_at < AppConfig.password_reset_window.hours.ago
			flash[:error] =  t("controllers.password_resets_controller.actions.update.errors.reset_expired")
			redirect_to new_password_reset_path
		elsif @user.update_attributes(params[:user])
			flash[:success] =  t("controllers.password_resets_controller.actions.update.success")
			redirect_to sign_in_path
		else
			flash.now[:error] = t("controllers.password_resets_controller.actions.update.errors.password_mismatch")
			render :edit
		end
	end
end
