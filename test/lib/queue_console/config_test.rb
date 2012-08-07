require './lib/queue_console/config'
require 'test_helper'

module QueueConsole
  class ConfigTest < MiniTest::Unit::TestCase
    def test_db
      Config.setup { |config| config.db = 'postgres' }
      assert_equal 'postgres', Config.db
    end
  end
end
