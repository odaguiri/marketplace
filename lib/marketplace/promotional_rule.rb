# frozen_string_literal: true

module Marketplace
  # Set our item promotion rules
  class PromotionalRule
    attr_reader :code, :price, :minimum_quantity

    def initialize(args)
      @code = args[:code]
      @price = args[:price]
      @minimum_quantity = args[:minimum_quantity]
    end
  end
end
