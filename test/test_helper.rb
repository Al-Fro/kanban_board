ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  parallelize(workers: 1)

  fixtures :all
end
