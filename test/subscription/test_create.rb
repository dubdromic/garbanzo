require 'minitest_helper'

module Garbanzo
  class TestSubscriptionCreate < Minitest::Test
    include AuthorizeStubs
    include AuthorizeCredentials

    def setup
      @klass = Garbanzo::Subscription::Create
      stub_authorize_request success_body
    end

    def success_body
      <<-BODY
<?xml version="1.0" encoding="utf-8"?>
<ARBCreateSubscriptionResponse
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xsd="http://www.w3.org/2001/XMLSchema"
  xmlns="AnetApi/xml/v1/schema/AnetApiSchema.xsd">
  <messages>
    <resultCode>Ok</resultCode>
    <message>
      <code>I00001</code>
      <text>Successful.</text>
    </message>
  </messages>
  <subscriptionId>2788088</subscriptionId>
</ARBCreateSubscriptionResponse>
BODY
    end

    def test_general_function
      card = { card_number: '4111111111111111', expiration_date: '2020-06' }
      address = { first_name: 'First', last_name: 'Last' }
      response = @klass
        .new(credentials).call(1, card, address, Duration.new(Date.today + 2), Interval.new)
      assert_equal response, { id: 2788088 }
    end
  end
end
