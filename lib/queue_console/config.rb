module QueueConsole
  class Config
    class << self
      attr_accessor :db

      def setup(&block)
        class_eval(&block)
      end

    end
  end
end
