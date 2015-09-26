module Garbanzo
  class Subscription
    class Update < Base
      def call(amount, *args)
        args.unshift (amount * 100).to_i
        super *args
      end

      private

      def ast_builder_klass
        Garbanzo::AST::Update
      end
    end
  end
end
