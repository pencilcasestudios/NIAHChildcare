class PasswordResetsController < ApplicationController
  skip_authorization_check

  def new
  end

  def create
		# Email the user
    user = User.where(User.arel_table[:email].matches(params[:identifier])).first #|| User.where(User.arel_table[:cell_phone_number].matches(params[:identifier])).first
		#Emailer.delay.password_reset(user)
		Emailer.password_reset(user).deliver
		redirect_to sign_in_path, notice: t("controllers.password_resets_controller.actions.create.notices.email_sent")
  end
end
