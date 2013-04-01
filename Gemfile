source "https://rubygems.org"




gem "rails", "~> 3.2.13"




# Used accross environments
gem "bcrypt-ruby"
gem "cancan"
gem "carrierwave"
gem "daemons"
gem "delayed_job_active_record"
gem "galetahub-simple_captcha", require: "simple_captcha"#, git: "git://github.com/galetahub/simple-captcha.git"
gem "jquery-rails"
gem "meta-tags", require: "meta_tags"
gem "mime-types" # Ref: https://github.com/jnicklas/carrierwave#setting-the-content-type
gem "nested_form"
gem "paper_trail"
gem "pcs_vegas"
gem "settingslogic"
gem "state_machine"




group :assets do
  gem "coffee-rails"
  gem "compass-rails"
  gem "sass-rails"
  gem "uglifier"
  gem "zurb-foundation", "~> 3.2.5"
end




group :development do
  gem "capistrano"
  gem "capistrano-ext"
  gem "letter_opener"
  gem "rvm-capistrano"
end

group :test do
  gem "capybara"
  gem "factory_girl_rails"
  gem "guard-bundler"
  gem "guard-rspec"
  gem "guard-spork"
  gem "launchy" # Ref: http://techiferous.com/2010/04/using-capybara-in-rails-3/ for save_and_open_page to work
  gem "rack_session_access"
  gem "spork-rails"
end

group :test, :development do
  gem "rb-inotify"
  gem "rspec-rails"
  gem "sqlite3"
end




group :production do
  gem "exception_notification"
  gem "mysql2"
end
