require 'minitest/autorun'
require 'rack/test'

ENV['RACK_ENV']     = 'test'
ENV['DATABASE_URL'] = 'postgres://revans@localhost/get_the_rundown_development'

module TestSupport
  include Rack::Test::Methods
  def app
    QueueConsole::Server.new
  end
end
