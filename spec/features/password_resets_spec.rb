require "spec_helper"

describe "PasswordResets" do
	it "emails user when requesting password reset" do
		user = FactoryGirl.create(:user)
		visit sign_in_path
		click_link I18n.t("views.sessions._form.links.forgot_password")
		fill_in I18n.t("views.password_resets.new.forms.placeholders.identifier"), with: user.email
		click_button I18n.t("views.password_resets.new.forms.buttons.submit")
		page.should have_content(I18n.t("controllers.password_resets_controller.actions.create.success"))
    last_email.to.should include(user.email)
  end

	it "does not email invalid user when requesting password reset" do
		visit sign_in_path
		click_link I18n.t("views.sessions._form.links.forgot_password")
		fill_in I18n.t("views.password_resets.new.forms.placeholders.identifier"), with: "ThisUserDefinitelyDoesNotExist@."
		click_button I18n.t("views.password_resets.new.forms.buttons.submit")
		page.should have_content(I18n.t("controllers.password_resets_controller.actions.create.error"))
		last_email.should be_nil
	end

  it "updates the user password when confirmation matches" do
    user = FactoryGirl.create(:user, password_reset_token: "something", password_reset_sent_at: 1.hour.ago)
    visit edit_password_reset_path(user.password_reset_token)

		password = "SomethingVerySecret"
		fill_in I18n.t("views.password_resets.edit.forms.placeholders.password"), with: password
		fill_in I18n.t("views.password_resets.edit.forms.placeholders.password_confirmation"), with: password

		click_button I18n.t("views.password_resets.edit.forms.buttons.submit")
		page.should have_content(I18n.t("controllers.password_resets_controller.actions.update.success"))
  end

	it "does not update the user password when the password and password confirmation don't match" do
		user = FactoryGirl.create(:user, password_reset_token: "something", password_reset_sent_at: 1.hour.ago)
		visit edit_password_reset_path(user.password_reset_token)

		password = "SomethingVerySecret"
		fill_in I18n.t("views.password_resets.edit.forms.placeholders.password"), with: password
		fill_in I18n.t("views.password_resets.edit.forms.placeholders.password_confirmation"), with: "SomethingElse"

		click_button I18n.t("views.password_resets.edit.forms.buttons.submit")
		page.should have_content(I18n.t("controllers.password_resets_controller.actions.update.errors.password_mismatch"))
	end

	it "does not update the user password after the password reset window has passed" do
		user = FactoryGirl.create(:user, password_reset_token: "something", password_reset_sent_at: (AppConfig.password_reset_window + 1).hours.ago)
		visit edit_password_reset_path(user.password_reset_token)

		password = "SomethingVerySecret"
		fill_in I18n.t("views.password_resets.edit.forms.placeholders.password"), with: password
		fill_in I18n.t("views.password_resets.edit.forms.placeholders.password_confirmation"), with: password

		click_button I18n.t("views.password_resets.edit.forms.buttons.submit")
		page.should have_content(I18n.t("controllers.password_resets_controller.actions.update.errors.reset_expired"))
	end
end
