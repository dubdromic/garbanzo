module Garbanzo
  class Subscription
    class Status < Base
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
