# CashRegister is a class that can take certain methods like a
# real cash register such as pay, purchase, and total.
class CashRegister
  def initialize
    @total = 0.0
  end

  # Adds cost to instance variable @total

  def purchase(cost)
    @total += cost
  end

  # Prints the total left in CashRegister

  def total
    "$#{currency(@total)}"
  end

  # Subtracts tender from instance variable @total. Prints out different
  # messages if you have a remaining @total or if you have paid in full
  # and require some change.

  def pay(tender)
    total_left = @total - tender
    if total_left > 0
      @total -= tender
      puts "Your new total is $#{currency(@total)}."
    else
      change = tender - @total
      puts "Your change is $#{currency(change)}."
      @total = 0.0
    end
  end

  # This method will print out numbers with two values after the
  # decimal point so the number appears like currency.

  def currency(number)
    # Round all floats to 2 decimal points

    currency = number.round(2)

    # Turn currency into a string and split at the decimal point

    test = currency.to_s.split('.').last

    # Check if there are two values after the decimal point in
    # currency. If not, add a zero to ensure printed numbers
    # looks like monetary values

    if test.length == 1
      currency.to_s + '0'
    else
      currency
    end
  end
end
