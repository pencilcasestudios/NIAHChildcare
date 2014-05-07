class PasswordResetsController < ApplicationController
  skip_authorization_check

  def new
  end

  def create
		user = User.where(User.arel_table[:email].matches(params[:identifier])).first #|| User.where(User.arel_table[:cell_phone_number].matches(params[:identifier])).first

		if user
			# Email the user
			user.send_password_reset
			redirect_to sign_in_path, notice: t("controllers.password_resets_controller.actions.create.notices.email_sent")
		else
			redirect_to sign_in_path, notice: t("controllers.password_resets_controller.actions.create.notices.email_not_sent")
		end
  end
end
