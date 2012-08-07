require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class MiniTest::Unit::TestCase
  include Rack::Test::Methods
end
