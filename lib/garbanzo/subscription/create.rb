module Garbanzo
  class Subscription
    class Create < Base
      def create(amount, card, address, duration, interval)
        amount = FormattedAmount.new(amount)
        ast = ast_builder.build(amount, card, address, duration, interval)
        Request.post ast.to_xml
      end

      private

      def ast_klass
        Garbanzo::AST::Create
      end
    end
  end
end
