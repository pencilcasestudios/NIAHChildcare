require "spec_helper"

describe User do
  describe "presence" do
    it "fails validation with no cell_phone_number" do
      user = User.new
      user.should have(2).error_on(:cell_phone_number)
      user.errors[:cell_phone_number].should == ["can't be blank", I18n.t("validators.cell_phone_number_format.error")]
    end

    it "fails validation with no email" do
      user = User.new
      user.should have(2).error_on(:email)
      user.errors[:email].should == ["can't be blank", I18n.t("validators.email_format.error")]
    end

    it "fails validation with no first_name" do
      user = User.new
      user.should have(1).error_on(:first_name)
      user.errors[:first_name].should == ["can't be blank"]
    end

    #it "fails validation with no middle_name" do
    #  user = User.new
    #  user.should have(1).error_on(:middle_name)
    #  user.errors[:middle_name].should == ["can't be blank"]
    #end

    it "fails validation with no last_name" do
      user = User.new
      user.should have(1).error_on(:last_name)
      user.errors[:last_name].should == ["can't be blank"]
    end

    it "fails validation with no language" do
      user = User.new
      user.should have(1).error_on(:language)
      user.errors[:language].should == ["can't be blank"]
    end

    it "fails validation with no role" do
      user = User.new(role: nil)
      user.should have(1).error_on(:role)
      user.errors[:role].should == ["can't be blank"]
    end

    it "fails validation with no time_zone" do
      user = User.new
      user.should have(1).error_on(:time_zone)
      user.errors[:time_zone].should == ["can't be blank"]
    end
  end

  describe "uniqueness" do
    it "fails validation with a duplicate cell_phone_number" do
      user = FactoryGirl.create(:user)
      duplicate = User.new(cell_phone_number: user.cell_phone_number)
      duplicate.should have(1).error_on(:cell_phone_number)
      duplicate.errors[:cell_phone_number].should == ["has already been taken"]
    end

    it "fails validation with a duplicate email" do
      user = FactoryGirl.create(:user)
      duplicate = User.new(email: user.email)
      duplicate.should have(1).error_on(:email)
      duplicate.errors[:email].should == ["has already been taken"]
    end
  end

  describe "format" do
    it "fails validation with an incorrect format for email" do
      user = User.new(email: "email-without-at-symbol")
      user.should have(1).error_on(:email)
      user.errors[:email].should == [I18n.t("validators.email_format.error")]
    end

    it "fails validation with an incorrect format for cell_phone_number" do
      user = User.new(cell_phone_number: "some ridiculously formatted cell phone number")
      user.should have(1).error_on(:cell_phone_number)
      user.errors[:cell_phone_number].should == [I18n.t("validators.cell_phone_number_format.error")]
    end
  end

  # http://railscasts.com/episodes/275-how-i-test?view=asciicast
  describe "sends password reset" do
    let(:user) { FactoryGirl.create(:user) } # assigns user to a new user from the factory before each spec is run.

    it "generates a unique password_reset_token each time" do
      user.send_password_reset
      last_token = user.password_reset_token
      user.send_password_reset
      user.password_reset_token.should_not eq(last_token)
    end

    it "saves the time the password reset was sent" do
      user.send_password_reset
      user.reload.password_reset_sent_at.should be_present
    end

    it "delivers email to user" do
      user.send_password_reset
      last_email.to.should include (user.email)
    end
  end
end
