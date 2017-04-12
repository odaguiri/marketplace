module Marketplace
  class Item
    attr_reader :code, :name, :price

    def initialize(args = {})
      @code = args[:code]
      @name = args[:name]
      @price = args[:price]
    end
  end
end
