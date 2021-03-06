module Cranson
  module Parsers
    class Fingal < Nokogiri::XML::SAX::Document
      include Observable

      attr_reader :current_object, :current_attribute

      def start_element(name, attrs = [])
        if name == 'Planning_Applications'
          @current_object = Cranson::PlanningApplication.new
        else
          return unless @current_object
          @current_attribute = name.downcase
        end
      end

      def characters(str)
        return if str.include? "\n"
        @current_object.send("#{@current_attribute}=", str)
      end

      def end_element(name)
        notify if name == 'Planning_Applications'
      end

      private

      def notify
        changed
        notify_observers(@current_object)
      end
    end
  end
end
