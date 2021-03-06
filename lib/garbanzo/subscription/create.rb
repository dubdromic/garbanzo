module Garbanzo
  class Subscription
    class Create < Base
      def call(amount, *args)
        args.unshift (amount * 100).to_i
        super *args
      end

      private

      def ast_builder_klass
        Garbanzo::AST::Create
      end
    end
  end
end
