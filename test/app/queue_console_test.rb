require 'test_helper'
require_relative '../../app/queue_console'

class QueueConsoleTest < MiniTest::Unit::TestCase
  include TestSupport

  def test_root_request
    get '/'
    last_response.ok?.must_equal true
    last_response.body.must_equal 'QueueConsole'
  end
end
