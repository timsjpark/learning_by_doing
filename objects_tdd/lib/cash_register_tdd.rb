# This is a CashRegister
class CashRegister
  def initialize
    @total = 0.0
  end

  def total
    "$#{sprintf('%.2f',@total)}"
  end

  def purchase(amount)
    @total += amount
    @total = @total.round(2)
  end

  def pay(amount)
    @total -= amount
    @total = @total.round(2)
  end
end
