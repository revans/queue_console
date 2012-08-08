require 'sinatra/base'
require 'queue_classic'
require 'time'

if defined? Encoding
  Encoding.default_external = Encoding::UTF_8
end

# TODO: Remove after testing
# Just for playing around - hopefully the client sets this ;)
module QueueConsole
  module_function
  def connection
    ENV['DATABASE_URL'] = 'postgres://revans@localhost/get_the_rundown_development'
  end
end

module QueueConsole
  module Queues
    module_function 

    def jobs
      [::QC::Conn.execute("SELECT * from queue_classic_jobs")].flatten
    end

    def job_count
      QC::Worker.new.queue.count
    end

    def get_queue_names
      [::QC::Conn.execute("SELECT q_name from queue_classic_jobs")].flatten
    end

  end
end

module QueueConsole
  class Server < Sinatra::Base
    dir = File.dirname(File.expand_path(__FILE__))
    set :views, "#{dir}/server/views"

    if respond_to? :public_folder
      set :public_folder, "#{dir}/server/public"
    else
      set :public, "#{dir}/server/public"
    end

    # TODO: Remove after testing
    # Setup the Queue Classic Connection
    QueueConsole.connection

    helpers do
      include Rack::Utils
      alias_method :h, :escape_html
      
      def url_path(*path_parts)
        [ path_prefix, path_parts ].join("/").squeeze('/')
      end
      alias :u :url_path

      def path_prefix
        request.env['SCRIPT_NAME']
      end

      def current_page
        url_path request.path_info.sub('/','')
      end
      
      def to_time(time)
        Time.parse(time).strftime("%B %d, %Y at %I:%M:%S %p")
      end
    end

    get '/overview' do
      @job_count  = QueueConsole::Queues.job_count
      @jobs       = QueueConsole::Queues.jobs || []
      haml :overview
    end

    get '/queues' do
      @queue_names = QueueConsole::Queues.get_queue_names || []
      haml :queues
    end

    get '/?' do
      redirect url_path(:overview)
    end
  end
end


