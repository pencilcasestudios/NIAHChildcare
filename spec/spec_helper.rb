require "rubygems"
require "spork"
#uncomment the following line to use spork with the debugger
#require "spork/ext/ruby-debug"
require "rack_session_access/capybara"


Spork.prefork do
  # This file is copied to spec/ when you run "rails generate rspec:install"
  ENV["RAILS_ENV"] ||= "test"
  require File.expand_path("../../config/environment", __FILE__)
  require "rspec/rails"
  require "rspec/autorun"
  require "capybara/rspec"

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # Mock Framework
    config.mock_with :rspec

    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    config.order = "random"

    #config.include(EmailerMacros)  
    #config.before(:each) { reset_email }  
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  FactoryGirl.reload
  I18n.reload!
  load "#{Rails.root}/config/routes.rb"
end
