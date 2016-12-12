module Cranson
  class Parser < Nokogiri::XML::SAX::Document
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
      if name == 'Planning_Applications'
        # @current_object is complete and ready
      end
    end
  end
end
