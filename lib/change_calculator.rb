# frozen_string_literal: true

class ChangeCalculator
  def self.calculate_change(coins, amount)
    remaining_change = amount
    change = {}

    coins.sort_by { |coin, _| -coin }.each do |coin, count|
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

  def self.update_coins(coins, change)
    change.each { |coin, count| coins[coin] -= count }
  end
end
