class User < ActiveRecord::Base
  apply_simple_captcha

  has_secure_password

  has_paper_trail

  has_many :family_profiles
  has_many :nanny_profiles

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

  validates :cell_phone_number, presence: true, uniqueness: true, cell_phone_number_format: true
  validates :email, presence: true, uniqueness: true, email_format: true
  validates :first_name, presence: true
  validates :language, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
  validates :terms_of_use, acceptance: true, on: :create
  validates :time_zone, presence: true




  ROLES = {
    # Translation                                   # Database key
    I18n.t("models.user.roles.user")          =>    "user",
    I18n.t("models.user.roles.administrator") =>    "administrator",
  }




  state_machine :state, initial: :registered do
    event :archive do
      transition registered: :archived
    end

    event :unarchive do
      transition archived: :registered
    end
  end




  def self.random_role
    ROLES[ROLES.to_a[rand ROLES.size].first]
  end

  def admin?
    self.role == "administrator"
  end

  def family?
    self.role == "family"
  end

  def nanny?
    self.role == "nanny"
  end

  def full_name
    [self.first_name, self.middle_name, self.last_name].compact.reject{|element| element.empty?}.join(" ")
  end

  # http://railscasts.com/episodes/275-how-i-test?view=asciicast
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!

    #Emailer.password_reset(self).deliver
    Emailer.delay.password_reset(self)
  end

  # http://railscasts.com/episodes/275-how-i-test?view=asciicast
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
