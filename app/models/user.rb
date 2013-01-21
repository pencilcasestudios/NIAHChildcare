class User < ActiveRecord::Base
  apply_simple_captcha

  has_secure_password

  has_paper_trail

  has_many :family_profiles

  validates :cell_phone_number, presence: true, uniqueness: true, cell_phone_number_format: true
  validates :email, presence: true, uniqueness: true, email_format: true
  validates :first_name, presence: true
  validates :language, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
  validates :terms_of_use, acceptance: true, on: :create
  validates :time_zone, presence: true

  attr_accessor :terms_of_use

  attr_accessible :captcha
  attr_accessible :captcha_key
  attr_accessible :cell_phone_number
  attr_accessible :email
  attr_accessible :first_name
  attr_accessible :language
  attr_accessible :last_name
  attr_accessible :middle_name
  attr_accessible :password
  attr_accessible :password_confirmation
  attr_accessible :role
  attr_accessible :state
  attr_accessible :terms_of_use
  attr_accessible :time_zone

  ROLES = {
    # Translation                                   # Database key
    I18n.t("models.user.roles.user")          =>    "user",
    I18n.t("models.user.roles.administrator") =>    "administrator",
  }

  def self.random_role
    ROLES[ROLES.to_a[rand ROLES.size].first]
  end

  def admin?
    self.role == "admin"
  end

  def family?
    self.role == "family"
  end

  def nanny?
    self.role == "nanny"
  end
end
