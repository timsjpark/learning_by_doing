# This is a CashRegister
class CashRegister
  def initialize
    @total = 0.0
  end

  def total
    "#{currency(@total)}"
  end

  def purchase(amount)
    @total += amount
    @total = @total.round(2)
  end

  def pay(amount)
    if @total - amount <= 0.0
      change = amount - @total
      @total = 0.0
      return "Your change is #{currency(change)}"
    else
      @total -= amount
      return "You still owe #{currency(@total)}"
    end
  end

  def currency(number)
    "$#{format('%.2f', number)}"
  end
end
