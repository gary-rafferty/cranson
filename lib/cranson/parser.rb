module Cranson
  class Parser < Nokogiri::XML::SAX::Document
    def start_element(name, attrs = [])
      p name
    end

    def characters(str)
      return if str.include? "\n"
      p str
    end

    def end_element(name)
      p name
    end
  end
end
