# This is a CashRegister
class CashRegister
  def initialize
    @total = 0.0
  end

  def total
    currency(@total)
  end

  def purchase(amount)
    @total += amount
    @total = @total.round(2)
  end

  def pay(amount)
    if @total - amount < 0.0
      change = amount - @total
      @total = 0.0
      "Your change is #{currency(change)}."
    elsif @total - amount == 0.0
      @total = 0.0
      'Thank you for paying the exact amount. There is no change.'
    else
      @total -= amount
      "You still owe #{currency(@total)}."
    end
  end

  def currency(number)
    "$#{format('%.2f', number)}"
  end
end
