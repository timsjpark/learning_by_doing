#!/usr/bin/env ruby

class CashRegister
  def initialize
    @total = 0
  end

  def purchase(cost)
    @total += cost
  end

  def total
    "$#{@total}"
  end

  def pay(tender)
    total_left = @total - tender
    if total_left > 0
      puts "Your new total is $#{total_left}."
      @total -= tender
    else
      change = tender - @total
      puts "Your change is $#{change}."
      @total = 0
    end
  end
end
