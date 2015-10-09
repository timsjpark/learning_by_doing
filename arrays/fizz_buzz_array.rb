#!/usr/bin/env ruby

numbers = (1..100).to_a

def replace_fizz_buzz(number)
  if number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  elsif number % 3 == 0
    'Fizz'
  elsif number % 5 == 0
    'Buzz'
  else
    number
  end
end

def fizz_buzz(array, index = 0)
  array[index] = replace_fizz_buzz(array[index])
  if index == array.length - 1
    return(array)
  else
    next_index = index + 1
  end
  fizz_buzz(array, next_index)
end

puts fizz_buzz(numbers)
