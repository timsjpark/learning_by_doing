#!/usr/bin/env ruby

numbers = (1..100).to_a

numbers.each do |item|
  if item % 3 == 0 && item % 5 == 0
    puts 'FizzBuzz'
  elsif item % 3 == 0
    puts 'Fizz'
  elsif item % 5 == 0
    puts 'Buzz'
  else
    puts item
  end
end
