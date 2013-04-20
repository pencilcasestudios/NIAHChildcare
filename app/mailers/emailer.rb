class Emailer < ActionMailer::Base
  def registration_notification(user)
    mail(
      from: "#{t("application.name")} <#{AppConfig.email_user_name}>",
      subject: t("mailers.emailer.registration_notification.subject", application_name: t("application.name"), user_id: user.id),
      to: "#{t("mailers.emailer.registration_notification.to.name")} <#{AppConfig.administrator_group_email}>",
    )
  end
end
