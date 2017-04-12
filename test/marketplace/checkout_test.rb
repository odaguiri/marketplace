require 'test_helper'

module Marketplace
  class CheckoutTest < TestHelper
    def setup
      @items = [
        Item.new(code: '001', name: 'Lavender heart', price: BigDecimal.new('9.25')),
        Item.new(code: '002', name: 'Personalised cufflinks', price: BigDecimal.new('45.0')),
        Item.new(code: '003', name: 'Kids T-shirt', price: BigDecimal.new('19.95'))
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
      assert_equal BigDecimal.new('54.25'), co.total
    end
  end
end
