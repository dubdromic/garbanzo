module Garbanzo
  module AST
    class Update < Base
      def build(subscription_id, amount, card, address, duration, interval)
        hash = {
          subscription_id: subscription_id,
          subscription: {
            payment_schedule: {
              start_date: duration.start_date,
              total_occurrences: duration.occurrences
            },
            amount: amount.to_i,
            payment: {
              credit_card: card.to_h
            },
            bill_to: address.to_h,
          }
        }

        set_nodes hash
      end

      private

      def type
        'ARBUpdateSubscriptionRequest'
      end
    end
  end
end
