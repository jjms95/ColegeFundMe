# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'devise'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
    config.infer_spec_type_from_file_location!
    config.filter_rails_from_backtrace!
    config.infer_base_class_for_anonymous_controllers = false
    config.expect_with(:rspec) { |c| c.syntax = :should }   

    config.include Warden::Test::Helpers
    config.include FactoryGirl::Syntax::Methods    
    config.extend ControllerMacros, :type => :controller
    config.extend ControllerMacros, :type => :view
    config.include Devise::Test::ControllerHelpers, type: :controller
    config.include Devise::Test::ControllerHelpers, type: :view
    config.include(Shoulda::Matchers::ActiveRecord, type: :model)
    config.expect_with :rspec do |c|
        c.syntax = [:should, :expect]
    end
    Warden.test_mode!
    config.after :each do
        Warden.test_reset!
    end
end