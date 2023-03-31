# frozen_string_literal: true

require_relative '../lib/change_calculator'
class CreditManager
  attr_reader :budget

  def initialize(change_calculator = ChangeCalculator)
    @coins = { 0.25 => 5, 0.5 => 5, 1 => 5, 2 => 5, 3 => 5, 5 => 5 } # default change
    @budget = 0
    @change_calculator = change_calculator
  end

  def insert_coins(inserted_coins)
    inserted_coins.each do |coin|
      raise "Invalid coin: #{coin}" unless @coins.key?(coin)

      @budget += coin
      @coins[coin] += 1
    end
  end

  def calculate_required_amount(item)
    item.price - @budget
  end

  def debit(amount)
    change = @change_calculator.calculate_change(@coins, amount)
    raise 'Not enough change in the machine' if change.nil?

    @budget -= amount
  end

  def return_change
    change = @change_calculator.calculate_change(@coins, @budget)
    raise 'Not enough change in the machine' if change.nil?

    update_coins(change)
    @budget = 0
    change
  end

  private

  def update_coins(change)
    change.each { |coin, count| @coins[coin] -= count }
  end
end
