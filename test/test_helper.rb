ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Devise test helpers
  # is warden still neded in 5.0?
  include Warden::Test::Helpers
  Warden.test_mode!

  # new rails 6.0 devise helppers
  #include Devise::Test::IntegrationHelpers
end

# removed headless operation for initial testing
# Capybara.register_driver :headless_chrome do |app|

Capybara.register_driver :chrome do |app|
  #options = Selenium::WebDriver::Chrome::Options.new(args: %w[no-sandbox headless disable-gpu window-size=1400,900])
  # removed headless options
  options = Selenium::WebDriver::Chrome::Options.new(args: %w[no-sandbox window-size=1400,900])
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end
Capybara.save_path = Rails.root.join('tmp/capybara')
Capybara.javascript_driver = :chrome

#Capybara.javascript_driver = :headless_chrome
