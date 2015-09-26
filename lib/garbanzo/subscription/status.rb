module Garbanzo
  class Subscription
    class Status < Base
      def status(subscription_id)
        ast = ast_builder.build(subscription_id)
        request ast.to_xml
      end

      private

      def ast_builder_klass
        Garbanzo::AST::Status
      end

      def response_klass
        StatusResponse
      end

      class StatusResponse < Response
        def success
          { status: node(:Status) }
        end
      end
    end
  end
end
