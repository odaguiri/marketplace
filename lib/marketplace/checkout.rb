module Marketplace
  class Checkout
    attr_reader :items

    def initialize
      @items = []
    end

    def scan(item)
      @items << item
    end
  end
end
