require 'test_helper'

module Marketplace
  class PromotionalRuleTest < TestHelper
    def setup
      @promotional_rule = PromotionalRule.new(code: '001', price: BigDecimal.new('8.50'), minimum_quantity: 2)
    end

    def test_should_have_code
      assert_equal '001', @promotional_rule.code
    end

    def test_should_have_price
      assert_equal BigDecimal.new('8.50'), @promotional_rule.price
    end

    def test_should_have_price
      assert_equal 2, @promotional_rule.minimum_quantity
    end
  end
end
