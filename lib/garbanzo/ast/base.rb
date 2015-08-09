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
          type => credentials_hash.merge(hash),
          :attributes! => { type => { xmlns: 'AnetApi/xml/v1/schema/AnetApiSchema.xsd' }}
        }
        self
      end

      def credentials_hash
        {
          merchant_authentication: {
            name: credentials.login,
            transaction_key: credentials.password
          }
        }
      end
    end
  end
end
