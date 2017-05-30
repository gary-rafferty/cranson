module Cranson
  module Parsers
    class DCC
      include Observable

      def initialize

      end

      def parse
        CSV.foreach(@file, headers: true) do |row|
          # instantiate new PlanningApplication
          # notify
        end
      end

      private

      def notify
        changed
        notify_observers(@current_object)
      end
    end
  end
end
