require 'test_helper'

module Marketplace
  class PromotionalRuleTest < TestHelper
    def test_should_have_code
      promotional_rule = PromotionalRule.new(code: '001', price: BigDecimal.new('8.50'), minimum_quantity: 2)
      assert_equal '001', promotional_rule.code
    end

    def test_should_have_price
      promotional_rule = PromotionalRule.new(code: '001', price: BigDecimal.new('8.50'), minimum_quantity: 2)
      assert_equal BigDecimal.new('8.50'), promotional_rule.price
    end

    def test_should_have_minimum_quantity
      promotional_rule = PromotionalRule.new(code: '001', price: BigDecimal.new('8.50'), minimum_quantity: 2)
      assert_equal 2, promotional_rule.minimum_quantity
    end

    def test_should_have_discount
      promotional_rule = PromotionalRule.new(discount: BigDecimal.new('0.1'), price: BigDecimal.new('60.0'))

      assert_equal BigDecimal.new('0.1'), promotional_rule.discount
    end
  end
end
