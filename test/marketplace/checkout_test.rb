require 'test_helper'

module Marketplace
  class CheckoutTest < TestHelper
    def setup
      @item = Item.new(code: '001', name: 'Lavender heart', price: BigDecimal.new('9.25'))

      @checkout = Checkout.new
      @checkout.scan(@item)
    end

    def test_should_have_items
      assert @checkout.items.size > 0
    end

    def test_should_have_item_one
      assert_equal @item, @checkout.items.select { |item| @item.code == item.code }[0]
    end
  end
end
