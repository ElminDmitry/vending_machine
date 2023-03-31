# frozen_string_literal: true

require_relative '../lib/change_calculator'
class CreditManager
  attr_reader :coins

  def initialize(change_calculator = ChangeCalculator)
    @coins = { 0.25 => 0, 0.5 => 0, 1 => 0, 2 => 0, 3 => 0, 5 => 0 }
    @change_calculator = change_calculator
  end

  def insert_coins(inserted_coins)
    inserted_coins.each do |coin|
      raise "Invalid coin: #{coin}" unless @coins.key?(coin)

      @coins[coin] += 1
    end
  end

  def user_credit
    @coins.sum { |coin, count| coin * count }
  end

  def calculate_required_amount(item)
    item.price - user_credit
  end

  def debit(amount)
    change = @change_calculator.calculate_change(@coins, amount)
    raise 'Not enough change in the machine' if change.nil?

    @change_calculator.update_coins(@coins, change)
  end

  def return_change
    change = @change_calculator.calculate_change(@coins, user_credit)
    raise 'Not enough change in the machine' if change.nil?

    @change_calculator.update_coins(@coins, change)
    change
  end
end
