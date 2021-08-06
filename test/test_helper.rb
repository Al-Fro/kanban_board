ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

Capybara.default_max_wait_time = 10
Capybara.app_host = 'http://localhost:3000'
Capybara.server_host = 'localhost'
Capybara.server_port = '3000'

require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  parallelize(workers: 1)

  fixtures :all
end
