require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

module TestSupport
  include Rack::Test::Methods
  def app
    QueueConsole::Server.new
  end
end
