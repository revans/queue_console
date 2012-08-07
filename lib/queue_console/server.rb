require 'sinatra/base'

if defined? Encoding
  Encoding.default_external = Encoding::UTF_8
end

module QueueConsole
  class Server < Sinatra::Base
    dir = File.dirname(File.expand_path(__FILE__))
    set :views, "#{dir}/server/views"

    helpers do
      include Rack::Utils
      alias_method :h, :escape_html
    end

    get '/' do
      haml :index
    end
  end
end
