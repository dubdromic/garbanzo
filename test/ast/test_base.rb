require 'minitest_helper'

module Garbanzo
  class TestASTBase < Minitest::Test

    class ASTChild < Garbanzo::AST::Base
      def call(hash)
        set_nodes hash
      end

      def type
        'TestParentNodeType'
      end
    end

    def setup
      credentials = Garbanzo::Credentials.new('test', 'password')
      @klass = ASTChild.new(credentials)
    end

    def test_type
      nodes = @klass.call({}).nodes
      assert_equal nodes['TestParentNodeType'].keys.first, :merchant_authentication
      assert_equal(
        nodes[:attributes!]['TestParentNodeType'],
        { xmlns: 'AnetApi/xml/v1/schema/AnetApiSchema.xsd' }
      )
    end
  end
end
