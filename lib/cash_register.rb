class CashRegister
    attr_accessor :total, :discount
    attr_reader :items
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @prevTotal = 0
        @items = []
    end
    def add_item(title, price, quantity = 1)
        quantity.times do
            self.items.push(title)
        end
        @prevTotal = self.total
        self.total += price * quantity
    end
    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = (self.total * (100 - self.discount) / 100.0).to_i
            "After the discount, the total comes to $#{self.total}."
        end
    end
    def void_last_transaction
        self.total = @prevTotal
    end
end