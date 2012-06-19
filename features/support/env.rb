ENV['RAILS_ENV'] ||= 'test'
require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'

  Capybara.default_selector = :css
  Cucumber::Rails::Database.javascript_strategy = :transaction
  ActionController::Base.allow_rescue = false

  Capybara.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

  Capybara.javascript_driver = :selenium
end

Spork.each_run do
end
