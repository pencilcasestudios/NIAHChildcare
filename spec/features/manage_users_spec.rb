require "spec_helper"
require "support/authentication_helper"

describe "User management" do
  describe "when not signed in" do

    before(:each) do
      visit register_path
    end

    # users#new
    describe "requesting sign up" do
      describe "as a Family" do

        before(:each) do
          click_link I18n.t("views.welcome.register.links.family_registration")
        end

        it "sign up with acceptable input" do
          first_name = "First"
          fill_in I18n.t("views.users._form.labels.first_name"), with: first_name

          middle_name = "Middle"
          fill_in I18n.t("views.users._form.labels.middle_name"), with: middle_name

          last_name = "Last"
          fill_in I18n.t("views.users._form.labels.last_name"), with: last_name

          email = "rose@example.com"
          fill_in I18n.t("views.users._form.labels.email"), with: email

          cell_phone_number = CellPhoneNumber.random
          fill_in I18n.t("views.users._form.labels.cell_phone_number"), with: cell_phone_number

          password = "password"
          fill_in I18n.t("views.users._form.labels.password"), with: password
          fill_in I18n.t("views.users._form.labels.password_confirmation"), with: password

          select I18n.t("models.language.names.eng"), from: I18n.t("views.users._form.labels.language")
          select "(GMT-05:00) Eastern Time (US & Canada)", from: I18n.t("views.users._form.labels.time_zone")

          check I18n.t("views.users._form.labels.terms_of_use")

          captcha = User.connection.execute("select * from simple_captcha_data").last
          fill_in "user_captcha", with: captcha["value"]

          click_button I18n.t("helpers.submit.user.create")

          current_path.should eq(sign_in_path)
          page.should have_content(I18n.t("controllers.users_controller.actions.create.success"))
        end

        it "rejects sign up with missing email" do
          blank_field = ""
          fill_in I18n.t("views.users._form.labels.email"), with: blank_field

          cell_phone_number = CellPhoneNumber.random
          fill_in I18n.t("views.users._form.labels.cell_phone_number"), with: cell_phone_number

          password = "password"
          fill_in I18n.t("views.users._form.labels.password"), with: password
          fill_in I18n.t("views.users._form.labels.password_confirmation"), with: password

          select I18n.t("models.language.names.eng"), from: I18n.t("views.users._form.labels.language")
          select "(GMT-05:00) Eastern Time (US & Canada)", from: I18n.t("views.users._form.labels.time_zone")

          check I18n.t("views.users._form.labels.terms_of_use")

          click_button I18n.t("helpers.submit.user.create")

          current_path.should eq(users_path)
          page.should have_content("#{I18n.t("views.users._errors.fields.email")} can't be blank")
        end

        it "rejects sign up with missing cell_phone_number" do
          fill_in I18n.t("views.users._form.labels.email"), with: "rose@example.com"

          cell_phone_number = CellPhoneNumber.random
          # Not filled in: fill_in I18n.t("views.users._form.labels.cell_phone_number"), with: cell_phone_number

          password = "password"
          fill_in I18n.t("views.users._form.labels.password"), with: password
          fill_in I18n.t("views.users._form.labels.password_confirmation"), with: password

          select I18n.t("models.language.names.eng"), from: I18n.t("views.users._form.labels.language")
          select "(GMT-05:00) Eastern Time (US & Canada)", from: I18n.t("views.users._form.labels.time_zone")

          check I18n.t("views.users._form.labels.terms_of_use")

          click_button I18n.t("helpers.submit.user.create")

          current_path.should eq(users_path)
          page.should have_content("#{I18n.t("views.users._errors.fields.cell_phone_number")} can't be blank")
        end

        it "rejects sign up with missing password" do
          fill_in I18n.t("views.users._form.labels.email"), with: "rose@example.com"

          cell_phone_number = CellPhoneNumber.random
          fill_in I18n.t("views.users._form.labels.cell_phone_number"), with: cell_phone_number

          password = "password"
          # Not filled in: fill_in I18n.t("views.users._form.labels.password"), with: password
          fill_in I18n.t("views.users._form.labels.password_confirmation"), with: password

          select I18n.t("models.language.names.eng"), from: I18n.t("views.users._form.labels.language")
          select "(GMT-05:00) Eastern Time (US & Canada)", from: I18n.t("views.users._form.labels.time_zone")

          check I18n.t("views.users._form.labels.terms_of_use")

          click_button I18n.t("helpers.submit.user.create")

          current_path.should eq(users_path)
          page.should have_content("#{I18n.t("views.users._errors.fields.password")} doesn't match confirmation")
        end

        it "rejects sign up with missing password_confirmation" do
          fill_in I18n.t("views.users._form.labels.email"), with: "rose@example.com"

          cell_phone_number = CellPhoneNumber.random
          fill_in I18n.t("views.users._form.labels.cell_phone_number"), with: cell_phone_number

          password = "password"
          fill_in I18n.t("views.users._form.labels.password"), with: password
          #Not filled in: fill_in I18n.t("views.users._form.labels.password_confirmation"), with: password

          select I18n.t("models.language.names.eng"), from: I18n.t("views.users._form.labels.language")
          select "(GMT-05:00) Eastern Time (US & Canada)", from: I18n.t("views.users._form.labels.time_zone")

          check I18n.t("views.users._form.labels.terms_of_use")

          click_button I18n.t("helpers.submit.user.create")

          current_path.should eq(users_path)
          page.should have_content("#{I18n.t("views.users._errors.fields.password")} doesn't match confirmation")
        end

        it "rejects sign up with missmatched password and password_confirmation" do
          fill_in I18n.t("views.users._form.labels.email"), with: "rose@example.com"

          cell_phone_number = CellPhoneNumber.random
          fill_in I18n.t("views.users._form.labels.cell_phone_number"), with: cell_phone_number

          fill_in I18n.t("views.users._form.labels.password"), with: "mbelele"
          fill_in I18n.t("views.users._form.labels.password_confirmation"), with: "ifinkubala"

          select I18n.t("models.language.names.eng"), from: I18n.t("views.users._form.labels.language")
          select "(GMT-05:00) Eastern Time (US & Canada)", from: I18n.t("views.users._form.labels.time_zone")

          check I18n.t("views.users._form.labels.terms_of_use")

          click_button I18n.t("helpers.submit.user.create")

          current_path.should eq(users_path)
          page.should have_content("#{I18n.t("views.users._errors.fields.password")} doesn't match confirmation")
        end

        it "rejects sign up without acceptance of terms_of_use" do
          fill_in I18n.t("views.users._form.labels.email"), with: "rose@example.com"

          cell_phone_number = CellPhoneNumber.random
          fill_in I18n.t("views.users._form.labels.cell_phone_number"), with: cell_phone_number

          password = "password"
          fill_in I18n.t("views.users._form.labels.password"), with: password
          fill_in I18n.t("views.users._form.labels.password_confirmation"), with: password

          select I18n.t("models.language.names.eng"), from: I18n.t("views.users._form.labels.language")
          select "(GMT-05:00) Eastern Time (US & Canada)", from: I18n.t("views.users._form.labels.time_zone")

          # Not filled in: check I18n.t("views.users._form.labels.terms_of_use")

          click_button I18n.t("helpers.submit.user.create")

          current_path.should eq(users_path)
          page.should have_content("#{I18n.t("views.users._errors.fields.terms_of_use")} must be accepted")
        end
      end

      describe "as a Nanny" do

        before(:each) do
          click_link I18n.t("views.welcome.register.links.nanny_registration")
        end

        it "sign up with acceptable input" do
          first_name = "First"
          fill_in I18n.t("views.users._form.labels.first_name"), with: first_name

          middle_name = "Middle"
          fill_in I18n.t("views.users._form.labels.middle_name"), with: middle_name

          last_name = "Last"
          fill_in I18n.t("views.users._form.labels.last_name"), with: last_name

          email = "rose@example.com"
          fill_in I18n.t("views.users._form.labels.email"), with: email

          cell_phone_number = CellPhoneNumber.random
          fill_in I18n.t("views.users._form.labels.cell_phone_number"), with: cell_phone_number

          password = "password"
          fill_in I18n.t("views.users._form.labels.password"), with: password
          fill_in I18n.t("views.users._form.labels.password_confirmation"), with: password

          select I18n.t("models.language.names.eng"), from: I18n.t("views.users._form.labels.language")
          select "(GMT-05:00) Eastern Time (US & Canada)", from: I18n.t("views.users._form.labels.time_zone")

          check I18n.t("views.users._form.labels.terms_of_use")

          captcha = User.connection.execute("select * from simple_captcha_data").last
          fill_in "user_captcha", with: captcha["value"]

          click_button I18n.t("helpers.submit.user.create")

          current_path.should eq(sign_in_path)
          page.should have_content(I18n.t("controllers.users_controller.actions.create.success"))
        end

        it "rejects sign up with missing email" do
          empty_field = ""
          fill_in I18n.t("views.users._form.labels.email"), with: empty_field

          cell_phone_number = CellPhoneNumber.random
          fill_in I18n.t("views.users._form.labels.cell_phone_number"), with: cell_phone_number

          password = "password"
          fill_in I18n.t("views.users._form.labels.password"), with: password
          fill_in I18n.t("views.users._form.labels.password_confirmation"), with: password

          select I18n.t("models.language.names.eng"), from: I18n.t("views.users._form.labels.language")
          select "(GMT-05:00) Eastern Time (US & Canada)", from: I18n.t("views.users._form.labels.time_zone")

          check I18n.t("views.users._form.labels.terms_of_use")

          click_button I18n.t("helpers.submit.user.create")

          current_path.should eq(users_path)
          page.should have_content("#{I18n.t("views.users._errors.fields.email")} can't be blank")
        end

        it "rejects sign up with missing cell_phone_number" do
          fill_in I18n.t("views.users._form.labels.email"), with: "rose@example.com"

          cell_phone_number = CellPhoneNumber.random
          # Not filled in: fill_in I18n.t("views.users._form.labels.cell_phone_number"), with: cell_phone_number

          password = "password"
          fill_in I18n.t("views.users._form.labels.password"), with: password
          fill_in I18n.t("views.users._form.labels.password_confirmation"), with: password

          select I18n.t("models.language.names.eng"), from: I18n.t("views.users._form.labels.language")
          select "(GMT-05:00) Eastern Time (US & Canada)", from: I18n.t("views.users._form.labels.time_zone")

          check I18n.t("views.users._form.labels.terms_of_use")

          click_button I18n.t("helpers.submit.user.create")

          current_path.should eq(users_path)
          page.should have_content("#{I18n.t("views.users._errors.fields.cell_phone_number")} can't be blank")
        end

        it "rejects sign up with missing password" do
          fill_in I18n.t("views.users._form.labels.email"), with: "rose@example.com"

          cell_phone_number = CellPhoneNumber.random
          fill_in I18n.t("views.users._form.labels.cell_phone_number"), with: cell_phone_number

          password = "password"
          # Not filled in: fill_in I18n.t("views.users._form.labels.password"), with: password
          fill_in I18n.t("views.users._form.labels.password_confirmation"), with: password

          select I18n.t("models.language.names.eng"), from: I18n.t("views.users._form.labels.language")
          select "(GMT-05:00) Eastern Time (US & Canada)", from: I18n.t("views.users._form.labels.time_zone")

          check I18n.t("views.users._form.labels.terms_of_use")

          click_button I18n.t("helpers.submit.user.create")

          current_path.should eq(users_path)
          page.should have_content("#{I18n.t("views.users._errors.fields.password")} doesn't match confirmation")
        end

        it "rejects sign up with missing password_confirmation" do
          fill_in I18n.t("views.users._form.labels.email"), with: "rose@example.com"

          cell_phone_number = CellPhoneNumber.random
          fill_in I18n.t("views.users._form.labels.cell_phone_number"), with: cell_phone_number

          password = "password"
          fill_in I18n.t("views.users._form.labels.password"), with: password
          #Not filled in: fill_in I18n.t("views.users._form.labels.password_confirmation"), with: password

          select I18n.t("models.language.names.eng"), from: I18n.t("views.users._form.labels.language")
          select "(GMT-05:00) Eastern Time (US & Canada)", from: I18n.t("views.users._form.labels.time_zone")

          check I18n.t("views.users._form.labels.terms_of_use")

          click_button I18n.t("helpers.submit.user.create")

          current_path.should eq(users_path)
          page.should have_content("#{I18n.t("views.users._errors.fields.password")} doesn't match confirmation")
        end

        it "rejects sign up with missmatched password and password_confirmation" do
          fill_in I18n.t("views.users._form.labels.email"), with: "rose@example.com"

          cell_phone_number = CellPhoneNumber.random
          fill_in I18n.t("views.users._form.labels.cell_phone_number"), with: cell_phone_number

          length = rand(26) # Length of random password string
          fill_in I18n.t("views.users._form.labels.password"), with: rand(36**length).to_s(36)
          fill_in I18n.t("views.users._form.labels.password_confirmation"), with: rand(36**length).to_s(36)

          select I18n.t("models.language.names.eng"), from: I18n.t("views.users._form.labels.language")
          select "(GMT-05:00) Eastern Time (US & Canada)", from: I18n.t("views.users._form.labels.time_zone")

          check I18n.t("views.users._form.labels.terms_of_use")

          click_button I18n.t("helpers.submit.user.create")

          current_path.should eq(users_path)
          page.should have_content("#{I18n.t("views.users._errors.fields.password")} doesn't match confirmation")
        end

        it "rejects sign up without acceptance of terms_of_use" do
          fill_in I18n.t("views.users._form.labels.email"), with: "rose@example.com"

          cell_phone_number = CellPhoneNumber.random
          fill_in I18n.t("views.users._form.labels.cell_phone_number"), with: cell_phone_number

          password = "password"
          fill_in I18n.t("views.users._form.labels.password"), with: password
          fill_in I18n.t("views.users._form.labels.password_confirmation"), with: password

          select I18n.t("models.language.names.eng"), from: I18n.t("views.users._form.labels.language")
          select "(GMT-05:00) Eastern Time (US & Canada)", from: I18n.t("views.users._form.labels.time_zone")

          # Not filled in: check I18n.t("views.users._form.labels.terms_of_use")

          click_button I18n.t("helpers.submit.user.create")

          current_path.should eq(users_path)
          page.should have_content("#{I18n.t("views.users._errors.fields.terms_of_use")} must be accepted")
        end
      end
    end
  end

  describe "when signed in" do
    before(:each) do
      sign_in_with_email
    end

    describe "requesting sign up" do
    end

    describe "requesting edit user account" do
      it "allows the user to edit their email" do
        visit edit_user_path(@current_user)

        updated_field = "rose#{Time.now.strftime("%s")}@example.com"
        fill_in I18n.t("views.users._form.labels.email"), with: updated_field

        click_button I18n.t("helpers.submit.user.update")

        current_path.should eq(user_path(@current_user))
        page.should have_content(I18n.t("controllers.users_controller.actions.update.success"))
        page.should have_content(updated_field)
      end

      it "allows the user to edit their cell_phone_number" do
        visit edit_user_path(@current_user)

        updated_field = CellPhoneNumber.random
        fill_in I18n.t("views.users._form.labels.cell_phone_number"), with: updated_field

        click_button I18n.t("helpers.submit.user.update")

        current_path.should eq(user_path(@current_user))
        page.should have_content(I18n.t("controllers.users_controller.actions.update.success"))
        page.should have_content(updated_field)
      end

      it "allows the user to edit their password" do
        pending "add tests for user password editing"
      end

      it "allows the user to edit their language" do
        pending "add tests for user language editing"
      end

      it "allows the user to edit their time zone" do
        pending "add tests for user time zone editing"
      end
    end
  end
end
