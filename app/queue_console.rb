require 'sinatra/base'

class QueueConsole < Sinatra::Base
  get '/' do
    haml :index, :format => :html5
  end
end
