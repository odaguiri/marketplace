module Marketplace
  # Controls our marketplace items
  class Checkout
    attr_reader :items

    def initialize
      @items = []
    end

    def scan(item)
      @items << item
    end

    def total
      @items.inject(0) { |sum, item| sum + item.price }
    end
  end
end
