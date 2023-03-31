# Vending Machine
## Task description
Design a vending machine in code. The vending machine, once a product is selected and the appropriate
amount of money (coins) is inserted, should return that product. It should also return
change (coins) if too much money is provided or ask for more money (coins)
if there is not enough (change should be printed as `coin * count` and as minimum coins as possible).
Keep in mind that you need to manage the scenario where the item is out of stock or
the machine does not have enough change to return to the customer.
Available coins: 0.25, 0.5, 1, 2, 3, 5
## How to run this project on your computer
1. Fork this repo
2. Clone your fork to your local machine: `git clone <url of your repo>`
3. In the project directory, run `bundle install`
4. Run `ruby main.rb` (you can edit file with your own examples)
## Usage examples
```
item1 = Item.new('Soda', 1.5)
item2 = Item.new('Chips', 3.5)
item3 = Item.new('Candy', 1.0)

machine = VendingMachine.new

machine.stock_item(item1, 10)
machine.stock_item(item2, 5)
machine.stock_item(item3, 20)

machine.insert_coins([1, 0.5])
puts machine.purchase(item1) # Purchased item: Soda. Your credit: 0.0

machine.insert_coins([1, 1, 0.5])
puts machine.purchase(item2) # Insufficient funds. Please insert 1.0 more.
```