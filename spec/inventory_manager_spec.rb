# frozen_string_literal: true

require_relative '../lib/inventory_manager'
require_relative '../lib/item'

RSpec.describe InventoryManager do
  let(:item) { Item.new('Soda', 1.5) }
  let(:manager) { InventoryManager.new }

  describe '#stock_item' do
    it 'stocks an item with a given quantity' do
      expect { manager.stock_item(item, 10) }.not_to raise_error
    end
  end

  describe '#validate_item_availability' do
    before do
      manager.stock_item(item, 10)
    end

    it 'raises an error if the item is not available' do
      expect { manager.validate_item_availability(Item.new('NotAvailable', 2)) }.to raise_error('Item not found')
    end

    it 'raises an error if the item is out of stock' do
      10.times { manager.decrement_item(item) }
      expect { manager.validate_item_availability(item) }.to raise_error('Item out of stock')
    end
  end

  describe '#decrement_item' do
    before do
      manager.stock_item(item, 10)
    end

    it 'decrements the quantity of an item' do
      expect { manager.decrement_item(item) }.not_to raise_error
    end
  end
end
