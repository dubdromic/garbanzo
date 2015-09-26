module Garbanzo
  class Subscription
    class Cancel < Base
      private

      def ast_builder_klass
        Garbanzo::AST::Cancel
      end
    end
  end
end
