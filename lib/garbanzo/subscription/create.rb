module Garbanzo
  class Subscription
    class Create < Base
      def call(amount, *args)
        args.unshift FormattedAmount.new(amount)
        super *args
      end

      private

      def ast_builder_klass
        Garbanzo::AST::Create
      end
    end
  end
end
