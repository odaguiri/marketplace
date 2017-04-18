require 'test_helper'

module Marketplace
  class CheckoutTest < TestHelper
    def setup
      @items = [
        Item.new(code: '001', name: 'Lavender heart', price: BigDecimal.new('9.25')),
        Item.new(code: '002', name: 'Personalised cufflinks', price: BigDecimal.new('45.0')),
        Item.new(code: '003', name: 'Kids T-shirt', price: BigDecimal.new('19.95'))
      ]

      @promotional_rules = [
        PromotionalRule.new(code: '001', discount: BigDecimal.new('0.081'), minimum_quantity: 2),
        PromotionalRule.new(code: 'total_discount', discount: BigDecimal.new('0.1'), price: BigDecimal.new('60.0'))
      ]
    end

    def test_should_be_an_array_of_items
      co = Checkout.new
      co.scan(@items[0])
      co.scan(@items[1])

      assert co.items.size == 2
    end

    def test_should_have_item_0
      co = Checkout.new
      co.scan(@items[0])
      assert_equal @items[0], co.items.select { |item| @items[0].code == item.code }[0]
    end

    def test_should_have_simple_sum
      co = Checkout.new
      co.scan(@items[0])
      co.scan(@items[1])
      assert_equal '£54.25', co.total
    end

    def test_should_sum_combination_one
      co = Checkout.new(@promotional_rules)
      co.scan(@items[0])
      co.scan(@items[1])
      co.scan(@items[2])

      assert_equal '£66.78', co.total
    end

    def test_should_sum_combination_two
      co = Checkout.new(@promotional_rules)
      co.scan(@items[0])
      co.scan(@items[2])
      co.scan(@items[0])

      assert_equal '£36.95', co.total
    end

    def test_should_sum_combination_three
      co = Checkout.new(@promotional_rules)
      co.scan(@items[0])
      co.scan(@items[1])
      co.scan(@items[0])
      co.scan(@items[2])

      assert_equal '£73.76', co.total
    end
  end
end
