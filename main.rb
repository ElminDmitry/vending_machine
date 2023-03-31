# frozen_string_literal: true

require_relative 'lib/item'
require_relative 'lib/vending_machine'

# Example usage

item1 = Item.new('Soda', 1.5)
item2 = Item.new('Chips', 3.5)
item3 = Item.new('Candy', 1.0)

machine = VendingMachine.new

machine.stock_item(item1, 10)
machine.stock_item(item2, 5)
machine.stock_item(item3, 20)

machine.insert_coins([1, 0.5])
puts machine.purchase(item1) # Purchased item: Soda. Your credit: 0.0

machine.insert_coins([1, 1, 0.5])
puts machine.purchase(item2) # Insufficient funds. Please insert 1.0 more.

machine.insert_coins([0.5, 1])
puts machine.purchase(item2) # Purchased item: Chips. Your credit: 0.5

machine.insert_coins([5])
puts machine.purchase(item3) # Purchased item: Candy. Your credit: 4.5
puts machine.return_change  # { 3 => 1, 1 => 1, 0.5 => 1 }
