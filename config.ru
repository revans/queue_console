$LOAD_PATH.unshift ::File.expand_path(::File.dirname(__FILE__) + '/lib')
require 'queue_console/server'
run QueueConsole::Server.new
