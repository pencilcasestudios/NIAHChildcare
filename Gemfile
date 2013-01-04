source "https://rubygems.org"




gem "rails"




gem "bcrypt-ruby"
gem "builder"
gem "cancan"
gem "delayed_job_active_record"
gem "galetahub-simple_captcha", require: "simple_captcha", git: "git://github.com/galetahub/simple-captcha.git"
gem "jquery-rails"
gem "mail"
gem "nested_form"
gem "paper_trail"
gem "pcs_vegas"
gem "settingslogic"
gem "sprockets"
gem "sqlite3"
gem "state_machine"





group :assets do
  gem "coffee-rails"
  gem "compass-rails"
  gem "sass-rails"
  gem "uglifier"
  gem "zurb-foundation"
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
  gem "rb-fsevent"
  gem "rb-inotify"
  gem "rspec-rails"
end




group :production do
  gem "mysql2"
end
