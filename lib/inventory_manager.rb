# frozen_string_literal: true

class InventoryManager
  def initialize
    @inventory = Hash.new(0)
  end

  def stock_item(item, quantity)
    @inventory[item] += quantity
  end

  def validate_item_availability(item)
    raise 'Item not found' unless @inventory.key?(item)
    raise 'Item out of stock' if @inventory[item] <= 0
  end

  def decrement_item(item)
    @inventory[item] -= 1
  end
end
