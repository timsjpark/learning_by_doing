#!/usr/bin/env ruby

numbers = (1..100).to_a

def fizz_buzz(array)
  array.map! { |i| i % 3 == 0 && i % 5 == 0 ? 'FizzBuzz' : i }
  array.map! { |i| i % 5 == 0 ? 'Buzz' : i }
  array.map! { |i| i % 3 == 0 ? 'Fizz' : i }
  array
end

puts fizz_buzz(numbers)

# Previous work commented out to practice modifying an existing
# array using Array specific methods.

# def replace_fizz_buzz(number)
#   if number % 3 == 0 && number % 5 == 0
#     'FizzBuzz'
#   elsif number % 3 == 0
#     'Fizz'
#   elsif number % 5 == 0
#     'Buzz'
#   else
#     number
#   end
# end
#
# def fizz_buzz(array, index = 0)
#   array[index] = replace_fizz_buzz(array[index])
#   if index == array.length - 1
#     return(array)
#   else
#     next_index = index + 1
#   end
#   fizz_buzz(array, next_index)
# end
#
# puts fizz_buzz(numbers)
