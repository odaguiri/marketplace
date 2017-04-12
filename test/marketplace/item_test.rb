require 'test_helper'

module Marketplace
  class ItemTest < TestHelper
    def setup
      @item = Item.new(code: '001', name: 'Lavender heart', price: BigDecimal.new('9.25'))
    end

    def test_should_have_code
      assert_equal '001', @item.code
    end

    def test_should_have_name
      assert_equal 'Lavender heart', @item.name
    end

    def test_should_have_price
      assert_equal BigDecimal.new('9.25'), @item.price
    end
  end
end
