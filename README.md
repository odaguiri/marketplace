# Marketplace

[![Code Climate](https://codeclimate.com/github/odaguiri/marketplace/badges/gpa.svg)](https://codeclimate.com/github/odaguiri/marketplace)

Our client is an online marketplace, here is a sample of some of the products available on our site:

Product code | Name | Price
-------------|------|-------
001 | Lavender heart | £9.25
002 | Personalised cufflinks | £45.00
003 | Kids T-shirt | £19.95

Our marketing team want to offer promotions as an incentive for our customers to purchase these items.

If you spend over £60, then you get 10% off of your purchase. If you buy 2 or more lavender hearts then the price drops to £8.50.

Our check-out can scan items in any order, and because our promotions will change, it needs to be flexible regarding our promotional rules.

The interface to our checkout looks like this (shown in Ruby):

```sh
bin/console
```

```ruby
promotional_rules = []
promotional_rules << Marketplace::PromotionalRule.new(code: '001', discount: BigDecimal.new('0.081'), minimum_quantity: 2)
promotional_rules << Marketplace::PromotionalRule.new(code: 'total_discount', discount: BigDecimal.new('0.1'), price: BigDecimal.new('60.0'))

co = Marketplace::Checkout.new(promotional_rules)
co.scan(Marketplace::Item.new(code: '001', name: 'Lavender heart', price: BigDecimal.new('9.25')))
co.scan(Marketplace::Item.new(code: '002', name: 'Personalised cufflinks', price: BigDecimal.new('45.0')))
co.scan(Marketplace::Item.new(code: '003', name: 'Kids T-shirt', price: BigDecimal.new('19.95')))

price = co.total

## Test data

```
Basket: 001,002,003
Total price expected: £66.78

Basket: 001,003,001
Total price expected: £36.95

Basket: 001,002,001,003
Total price expected: £73.76
```
