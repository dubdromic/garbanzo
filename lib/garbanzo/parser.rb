require 'nokogiri'

module Garbanzo
  class Parser
    def initialize(raw_document)
      @raw_document = raw_document
    end

    private

    attr_reader :raw_document

    def node(name)
      document.search(name.to_s).text
    end

    def document
      @document ||= Nokogiri::XML.parse raw_document
    end
  end
end
