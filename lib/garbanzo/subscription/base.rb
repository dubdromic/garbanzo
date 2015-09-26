require 'gyoku'

module Garbanzo
  class Subscription
    class Base
      module XMLFormatter
        def to_xml
          Gyoku.xml(self.nodes)
        end
      end

      FormattedAmount = Struct.new(:amount) do
        def to_i
          (amount * 100).to_i
        end
      end

      def initialize(credentials)
        @credentials = credentials
      end

      private

      attr_reader :credentials

      def request(xml)
        response_klass.wrap Request.post(xml, credentials.test_mode)
      end

      def response_klass
        Response
      end

      def ast_builder
        ast_builder_klass.new(credentials).extend(formatter)
      end

      def formatter
        XMLFormatter
      end
    end
  end
end
