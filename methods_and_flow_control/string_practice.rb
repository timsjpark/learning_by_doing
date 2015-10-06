#!/usr/bin/env ruby

practice_string = 'this is a string to practice with'

puts practice_string.downcase
puts practice_string.capitalize
puts practice_string.upcase
puts practice_string.capitalize.gsub('string', "'string'")
puts "The string '#{practice_string}' has #{practice_string.length} characters"
puts practice_string.reverse
puts practice_string.replace('practice practice practice!')
