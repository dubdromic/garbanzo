module Garbanzo
  module AST
    class Base
      attr_accessor :nodes

      def initialize(credentials)
        @credentials = credentials
        @nodes = {}
      end

      private

      attr_reader :credentials

      def set_nodes(hash)
        @nodes = {
          type => hash.merge(credentials.to_h),
          :attributes! => { type => { xmlns: 'AnetApi/xml/v1/schema/AnetApiSchema.xsd' }}
        }
        self
      end
    end
  end
end
