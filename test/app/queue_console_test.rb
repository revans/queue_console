require 'test_helper'
require_relative '../../app/queue_console'

class QueueConsoleTest < MiniTest::Unit::TestCase
  include TestSupport

  def test_root_request
    get '/'
    last_response.ok?.must_equal true
    last_response.body.strip.must_equal '<h1>Hello World</h1>'
  end
end
