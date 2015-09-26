module Garbanzo
  module AST
    class Cancel < Base
      def build(subscription_id)
        hash = {
          subscription_id: subscription_id
        }

        set_nodes hash
      end

      private

      def type
        'ARBCancelSubscriptionRequest'
      end
    end
  end
end
