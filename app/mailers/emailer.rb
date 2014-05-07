class Emailer < ActionMailer::Base
  # If we are not deploying the live production site, flag this in the subject line
  @environment = I18n.t("mailers.emailer.notify_admins_of_new_user_registration.environment.test")
  if AppConfig.http_basic_access_mode == AppConfig.CLOSED
    @environment = ""
  end




  # When a new user signs up, notify admins by email
  def notify_admins_of_new_user_registration(user)
    mail(
      from: "#{t("application.name")} <#{AppConfig.email_user_name}>",
      subject: t("mailers.emailer.notify_admins_of_new_user_registration.subject", application_name: t("application.name"), user_id: user.id, environment: @environment),
      to: "#{t("mailers.emailer.notify_admins_of_new_user_registration.to.admin_at_niahchildcare")} <#{AppConfig.admin_at_niahchildcare}>, #{t("mailers.emailer.notify_admins_of_new_user_registration.to.itsupport_at_pencilcasestudios")} <#{AppConfig.itsupport_at_pencilcasestudios}>",
    )
  end




  # Ref: http://railscasts.com/episodes/275-how-i-test?view=asciicast
  # Email password reset instructions
  def password_reset(user)
    #mail(
    #  from: "from@example.com",
    #  subject: "Password Reset",
    #  to: user.email,
    #)

    mail(
      from: "#{t("application.name")} <#{AppConfig.email_user_name}>",
      subject: t("mailers.emailer.password_reset.subject", application_name: t("application.name"), environment: @environment),
      to: "#{user.full_name} <#{user.email}>",
    )
  end
end
