class Emailer < ActionMailer::Base
  def notify_admins_of_new_user_registration(user)
    mail(
      from: "#{t("application.name")} <#{AppConfig.email_user_name}>",
      subject: t("mailers.emailer.notify_admins_of_new_user_registration.subject", application_name: t("application.name"), user_id: user.id),
      to: "#{t("mailers.emailer.notify_admins_of_new_user_registration.to.admin_at_niahchildcare")} <#{AppConfig.admin_at_niahchildcare}>, #{t("mailers.emailer.notify_admins_of_new_user_registration.to.itsupport_at_pencilcasestudios")} <#{AppConfig.itsupport_at_pencilcasestudios}>",
    )
  end
end
