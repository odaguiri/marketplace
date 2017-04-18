# frozen_string_literal: true

module Marketplace
  # Controls our marketplace items
  class Checkout
    # We are working just with £
    MONEY_FORMAT = '£'.freeze

    attr_reader :items, :promotional_rules

    def initialize(promotional_rules = [])
      @items = []
      @promotional_rules = promotional_rules
    end

    def scan(item)
      @items << item
    end

    def total
      sum = (promotional_per_item + amount).inject(0, :+)
      price = promotional_total_discount(sum).to_f.round(2)
      "#{MONEY_FORMAT}#{price}"
    end

    private

    def select_by_code(code)
      @items.select { |item| item.code == code }
    end

    def promotional_per_item
      @promotional_rules.map do |rule|
        items = select_by_code(rule.code)
        next unless items.size.positive?
        price = items[0].price
        price = price * (1 - rule.discount) if items.size >= rule.minimum_quantity
        items.size * price
      end.compact
    end

    def promotional_total_discount(calculated)
      rule = @promotional_rules.find { |item| item.code == 'total_discount' }
      return calculated if !rule || calculated < rule.price
      calculated - (calculated * rule.discount)
    end

    def amount
      @items.reject do |item|
        @promotional_rules.map(&:code).include? item.code
      end.map(&:price)
    end
  end
end
