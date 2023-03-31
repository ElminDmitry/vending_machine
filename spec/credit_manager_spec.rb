# frozen_string_literal: true

require_relative '../lib/credit_manager'
require_relative '../lib/item'

RSpec.describe CreditManager do
  let(:manager) { CreditManager.new }
  let(:item) { Item.new('Coke', 2) }

  describe '#insert_coins' do
    it 'inserts coins and updates user credit' do
      expect { manager.insert_coins([0.25, 0.5, 1, 2]) }.not_to raise_error
      expect(manager.user_credit).to eq(3.75)
    end
  end

  describe '#calculate_required_amount' do
    before do
      manager.insert_coins([1, 1])
    end

    it 'calculates the required amount for an item' do
      expect(manager.calculate_required_amount(item)).to eq(0)
    end
  end

  describe '#return_change' do
    context 'when enough change' do
      before do
        manager.insert_coins([1, 1, 0.5, 0.25, 1, 1])
        manager.debit(2)
      end

      it 'returns change after a purchase' do
        expect(manager.return_change).to eq({ 1 => 2, 0.5 => 1, 0.25 => 1 })
      end
    end

    context 'when not enough change' do
      before do
        manager.insert_coins([5, 5])
      end

      it 'raises error when not enough change in the machine' do
        expect { manager.debit(6) }.to raise_error('Not enough change in the machine')
      end
    end
  end

  describe '#debit' do
    before do
      manager.insert_coins([1, 1])
    end

    it 'debits an amount from the user credit' do
      expect { manager.debit(1) }.not_to raise_error
      expect(manager.user_credit).to eq(1)
    end
  end
end
