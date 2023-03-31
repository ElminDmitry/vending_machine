# frozen_string_literal: true

require_relative '../lib/change_calculator'

RSpec.describe ChangeCalculator do
  let(:change_calculator) { ChangeCalculator }
  let(:coins) { { 5 => 2, 3 => 3, 2 => 3, 1 => 2, 0.5 => 2, 0.25 => 2 } }

  describe '.calculate_change' do
    it 'calculates the change correctly' do
      change = change_calculator.calculate_change(coins, 11.5)
      expect(change).to eq({ 5 => 2, 1 => 1, 0.5 => 1 })
    end
  end
end
