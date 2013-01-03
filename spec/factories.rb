FactoryGirl.define do
  factory :user do
    language Language::NAMES[I18n.t("models.language.names.eng")]
    password AppConfig.test_user_password
    sequence(:cell_phone_number) { CellPhoneNumber.random }
    sequence(:email) { |n| "user_email#{n}@example.com" }
    sequence(:first_name) { |n| "FirstName#{n}" }
    sequence(:last_name) { |n| "LastName#{n}" }
    sequence(:middle_name) { |n| "MiddleName#{n}" }
    sequence(:role) { User.random_role }
    time_zone "Africa/Lusaka"
  end
end
