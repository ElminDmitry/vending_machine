# frozen_string_literal: true

class CreditManager
  attr_reader :user_credit

  def initialize
    @coins = { 0.25 => 0, 0.5 => 0, 1 => 0, 2 => 0, 3 => 0, 5 => 0 }
    @user_credit = 0
  end

  def insert_coins(inserted_coins)
    inserted_coins.each do |coin|
      raise "Invalid coin: #{coin}" unless @coins.key?(coin)

      @user_credit += coin
      @coins[coin] += 1
    end
  end

  def calculate_required_amount(item)
    item.price - @user_credit
  end

  def debit(amount)
    @user_credit -= amount
  end

  def coins
    @coins.dup
  end
end
