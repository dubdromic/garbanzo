module Garbanzo
  module AST
    class Status < Base
      def build(subscription_id)
        hash = {
          subscription_id: subscription_id
        }

        set_nodes hash
      end

      private

      def type
        'ARBGetSubscriptionStatusRequest'
      end
    end
  end
end
