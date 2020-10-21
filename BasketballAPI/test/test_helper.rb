ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require File.expand_path("../../config/environment", __FILE__)
require 'rails/test_help'
require "minitest"
require 'minitest/rails'
require 'minitest/reporters'
require 'minitest_extensions'
require 'contexts'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all
  include Contexts

  # Add more helper methods to be used by all tests here...
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :minitest
      with.library :rails
    end
  end
end
