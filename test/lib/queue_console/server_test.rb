require 'test_helper'
require_relative '../../../lib/queue_console/server'

module QueueConsole
  class ServerTest < MiniTest::Unit::TestCase
    include TestSupport

    def test_root_request
      get '/'
      last_response.ok?.must_equal true
      last_response.body.strip.must_equal "<!DOCTYPE html>
<html>
  <head>
    <title>Queue Console</title>
    <meta content='' name='description' />
    <meta content='' name='author' />
    <link href='http://creativecommons.org/licenses/by/3.0/' rel='license' title='Creative Commons Attribution 3.0 Unported License' />
    <link href='/css/screen.css' media='screen' rel='stylesheet' />
  </head>
  <body>
    <h1>Hello World</h1>
  </body>
</html>"
    end
  end
end
