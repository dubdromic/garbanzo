module Garbanzo
  module AST
    class Create < Base
      def build(amount, card, address, duration, interval)
        hash = {
          payment_schedule: {
            interval: interval.to_h,
            start_date: duration.start_date,
            total_occurrences: duration.occurrences
          },
          amount: amount.to_i,
          payment: {
            credit_card: card.to_h
          },
          address: address.to_h
        }

        set_nodes hash
      end

      private

      def type
        'ARBCreateSubscriptionRequest'
      end
    end
  end
end
