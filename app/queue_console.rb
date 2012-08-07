require 'sinatra/base'

if defined? Encoding
  Encoding.default_external = Encoding::UTF_8
end

class QueueConsole < Sinatra::Base
  get '/' do
    haml :index, :format => :html5
  end
end
