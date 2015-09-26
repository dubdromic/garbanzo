require 'minitest_helper'

module Garbanzo
  class TestSubscription < Minitest::Test
    include AuthorizeConnection

    def setup
      stub_connection
      @subscription = Garbanzo::Subscription.new
    end

    def test_assignment
      @subscription.attributes = {
        amount: 100,
        card: { test: :hash },
        interval: Interval.new(14, :days)
      }

      assert_equal(100, @subscription.amount)
      assert_equal({ test: :hash }, @subscription.card)
      assert_equal(:days, @subscription.interval.unit)
      assert_equal(9999, @subscription.duration.occurrences)
    end

    # NB: remove once methods are actually tested
    def test_method_presence
      assert_respond_to @subscription, :save
      assert_respond_to @subscription, :cancel
      assert_respond_to @subscription, :status
    end

    def test_create
      @subscription.id = nil
      Garbanzo::Subscription::Create.stub(:call, { id: 123 }) do
        assert @subscription.save
        assert_equal 123, @subscription.id
      end

      @subscription.id = nil
      Garbanzo::Subscription::Create.stub(:call, { errors: ['Error'] }) do
        refute @subscription.save
        assert_equal [['Error']], @subscription.errors.full_messages
      end
    end

    def test_update
      @subscription.id = 123
      Garbanzo::Subscription::Update.stub(:call, { id: 123 }) do
        assert @subscription.save
        assert_equal 123, @subscription.id
      end

      Garbanzo::Subscription::Update.stub(:call, { errors: ['Error'] }) do
        refute @subscription.save
        assert_equal [['Error']], @subscription.errors.full_messages
      end
    end

    def test_cancel
      @subscription.id = 123
      Garbanzo::Subscription::Cancel.stub(:call, { id: 123 }) do
        assert @subscription.cancel
      end

      Garbanzo::Subscription::Cancel.stub(:call, { errors: ['Error'] }) do
        assert @subscription.cancel
        assert_equal [['Error']], @subscription.errors.full_messages
      end
    end

    def test_status
      @subscription.id = 123
      Garbanzo::Subscription::Status.stub(:call, { internal_status: 'active' }) do
        assert_equal 'active', @subscription.status
      end

      # Reset to default
      @subscription.internal_status = nil

      Garbanzo::Subscription::Status.stub(:call, { errors: ['Error'] }) do
        assert_equal nil, @subscription.status
        assert_equal [['Error']], @subscription.errors.full_messages
      end
    end
  end
end
