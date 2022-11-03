require "pry"

class CashRegister
    attr_accessor :total, :discount, :items

    @@price_history = []

    def initialize discount = "", items = []
        @total = 0
        @discount = discount
        @items = items
    end

    def add_item title, price, quantity=1
        self.total = self.total + price*quantity

        quantity.times do 
            self.items << title
            @@price_history << price
            @@price_history << quantity
        end
    end

    def apply_discount
        if self.discount == ""
            return "There is no discount to apply."
        end
        self.total = (100 - discount)/100.0 *self.total
        "After the discount, the total comes to $#{self.total.to_i}."
    end

    def void_last_transaction
        self.items = self.items.pop
        self.total = self.total - @@price_history[-2] * @@price_history[-1]
        binding.pry
    end
end