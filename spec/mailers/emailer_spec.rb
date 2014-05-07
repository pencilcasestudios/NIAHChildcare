require "spec_helper"

@environment = I18n.t("mailers.emailer.notify_admins_of_new_user_registration.environment.test")
if AppConfig.http_basic_access_mode == AppConfig.CLOSED
  @environment = ""
end

describe Emailer do
  describe "password_reset" do
    let(:user) { FactoryGirl.create(:user, :password_reset_token => "anything") }
    let(:mail) { Emailer.password_reset(user) }

    it "sends user password reset url" do
      mail.subject.should eq(I18n.t("mailers.emailer.password_reset.subject", application_name: I18n.t("application.name"), environment: @environment))
      mail.to.should eq([user.email])
      mail.from.should eq([AppConfig.email_user_name])
    end

    it "renders the body" do
      mail.body.encoded.should match(edit_password_reset_path(user.password_reset_token))
    end
  end
end
