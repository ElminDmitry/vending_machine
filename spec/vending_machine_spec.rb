# frozen_string_literal: true

require_relative '../lib/vending_machine'
require_relative '../lib/item'

RSpec.describe VendingMachine do
  let(:item) { Item.new('Soda', 1) }
  let(:machine) { VendingMachine.new }

  describe '#stock_item' do
    it 'stocks an item with a given quantity' do
      expect { machine.stock_item(item, 10) }.not_to raise_error
    end
  end

  describe '#insert_coins' do
    it 'inserts coins and updates user credit' do
      expect { machine.insert_coins([0.25, 0.5, 1]) }.not_to raise_error
    end
  end

  describe '#purchase' do
    before do
      machine.stock_item(item, 1)
      machine.insert_coins([1, 1])
    end

    it 'purchases an item and updates user credit' do
      expect(machine.purchase(item)).to eq('Purchased item: Soda. Your credit: 1.0')
    end
  end

  describe '#return_change' do
    before do
      machine.stock_item(item, 1)
      machine.insert_coins([1, 1, 1])
      machine.purchase(item)
    end

    it 'returns change and resets user credit' do
      expect(machine.return_change).to eq({ 1 => 2 })
    end
  end
end
