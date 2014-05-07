require "spec_helper"

describe "PasswordResets" do
	it "emails user when requesting password reset" do
		user = FactoryGirl.create(:user)
		visit sign_in_path
		click_link I18n.t("views.sessions._form.links.forgot_password")
		fill_in I18n.t("views.password_resets._form.placeholders.identifier"), with: user.email
		click_button I18n.t("views.password_resets._form.buttons.submit")
		page.should have_content(I18n.t("controllers.password_resets_controller.actions.create.notices.email_sent"))
    last_email.to.should include(user.email)
  end

	it "does not email invalid user when requesting password reset" do
		visit sign_in_path
		click_link I18n.t("views.sessions._form.links.forgot_password")
		fill_in I18n.t("views.password_resets._form.placeholders.identifier"), with: "ThisUserDefinitelyDoesNotExist@."
		click_button I18n.t("views.password_resets._form.buttons.submit")
		page.should have_content(I18n.t("controllers.password_resets_controller.actions.create.notices.email_not_sent"))
		last_email.should be_nil
	end
end
