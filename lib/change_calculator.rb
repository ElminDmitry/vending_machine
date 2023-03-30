# frozen_string_literal: true

class ChangeCalculator
  def initialize(credit_manager)
    @credit_manager = credit_manager
  end

  def calculate_change
    remaining_change = @credit_manager.user_credit
    change = {}

    @credit_manager.coins.sort_by { |coin, _| -coin }.each do |coin, count|
      num_coins = (remaining_change / coin).floor
      num_coins = count if num_coins > count

      if num_coins > 0
        change[coin] = num_coins
        remaining_change -= coin * num_coins
      end

      break if remaining_change.zero?
    end

    remaining_change.zero? ? change : nil
  end

  def update_coins_after_returning_change
    change = calculate_change
    return if change.nil?

    change.each { |coin, count| @credit_manager.coins[coin] -= count }
    @credit_manager.debit(change.sum { |coin, count| coin * count })
  end
end
