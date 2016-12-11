module Cranson
  class Parser < Nokogiri::XML::SAX::Document
    def start_element(name, attrs = [])
    end

    def characters(str)
    end

    def end_element(name)
    end
  end
end
