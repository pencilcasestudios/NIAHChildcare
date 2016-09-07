# Sparkpost
# Ref: http://thehungrycoder.com/ruby-on-rails/integrate-sparkpost-in-your-rails-app.html
#ActionMailer::Base.smtp_settings = {
#    user_name: 'SMTP_Injection',
#    password: 'Any API Key with Send via SMTP permission',
#    address: 'smtp.sparkpostmail.com',
#    port: 587,
#    enable_starttls_auto: true,
#    format: :html,
#    from: 'mailer@yourawesomeapp.com'
#}


# Sendgrid
# Ref: https://sendgrid.com/docs/Integrate/Frameworks/rubyonrails.html
#ActionMailer::Base.smtp_settings = {
#  :user_name => 'your_sendgrid_username',
#  :password => 'your_sendgrid_password',
#  :domain => 'yourdomain.com',
#  :address => 'smtp.sendgrid.net',
#  :port => 587,
#  :authentication => :plain,
#  :enable_starttls_auto => true
#}


# settings-logic
#ActionMailer::Base.smtp_settings = {
#	address:              AppConfig.email_address,
#	enable_starttls_auto: true,
#	password:             AppConfig.email_password,
#	port:                 AppConfig.email_port,
#	user_name:            AppConfig.email_user_name,
#}


ActionMailer::Base.smtp_settings = {
  address:              AppConfig.email_address,
  authentication:       :plain,
  domain:               AppConfig.email_domain,
  enable_starttls_auto: true,
  password:             AppConfig.email_password,
  port:                 AppConfig.email_port,
  user_name:            AppConfig.email_user_name,
}


ActionMailer::Base.default_url_options[:host] = AppConfig.application_server_name
