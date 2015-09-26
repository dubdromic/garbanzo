module Garbanzo
  class Subscription
    class Cancel < Base
      def cancel(subscription_id)
        ast = ast_builder.build(subscription_id)
        request ast.to_xml
      end

      private

      def ast_builder_klass
        Garbanzo::AST::Cancel
      end
    end
  end
end
