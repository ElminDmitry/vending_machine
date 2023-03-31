# frozen_string_literal: true

require_relative 'inventory_manager'
require_relative 'credit_manager'

class VendingMachine
  def initialize
    @inventory_manager = InventoryManager.new
    @credit_manager = CreditManager.new
  end

  def stock_item(item, quantity)
    @inventory_manager.stock_item(item, quantity)
  end

  def insert_coins(inserted_coins)
    @credit_manager.insert_coins(inserted_coins)
  end

  def purchase(item)
    @inventory_manager.validate_item_availability(item)
    required_amount = @credit_manager.calculate_required_amount(item)

    raise "Insufficient funds, please insert #{required_amount} more" if required_amount > 0

    @credit_manager.debit(item.price)
    @inventory_manager.decrement_item(item)

    "Purchased item: #{item.name}. Your credit: #{@credit_manager.user_credit}"
  end

  def return_change
    change = @credit_manager.return_change
    raise 'Not enough change in the machine' if change.nil?

    change
  end
end
