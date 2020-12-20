class CashRegister

    attr_accessor :total, :discount

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @last_total = 0
        @cart = []
    end

    def total
        return @total
    end

    def add_item(title, price, quant = 1)
        @last_total = price * quant
        @total += price * quant
        
        while quant > 0
            @cart << title
            quant -= 1
        end
    end

    def apply_discount
        if @discount > 0
            percent = @discount / 100.00
            @total = @total - (percent * @total).to_i
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @cart
    end

    def void_last_transaction
        @total -= @last_total
        @cart.pop()
        if @cart.length == 0
            @total = 0.0
        end
    end
end
