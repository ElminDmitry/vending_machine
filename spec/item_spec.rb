# frozen_string_literal: true

require_relative '../lib/item'

RSpec.describe Item do
  it 'initializes with a name and price' do
    item = Item.new('Soda', 1.5)
    expect(item.name).to eq('Soda')
    expect(item.price).to eq(1.5)
  end
end
