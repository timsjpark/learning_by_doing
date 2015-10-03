#!/usr/bin/env ruby

seconds_per_minute = 60
minutes_per_hour = 60
hours_per_day = 24
days_per_week = 7
days_per_year = 365
seconds_per_hour = seconds_per_minute * minutes_per_hour
seconds_per_day = seconds_per_hour * hours_per_day
seconds_per_year = seconds_per_day * days_per_year

puts 'There are 60 seconds in a minute'
puts 'There are 60 minutes in an hour'
puts 'There are 24 hours in a day'
puts 'There are 7 days in a week'
puts 'That means there are:'
puts "  #{seconds_per_hour} seconds in an hour,"
puts "  #{seconds_per_day} seconds in a day,"
puts "  #{seconds_per_day * days_per_week} seconds in a week"
puts "That means when you turn 20, you've been alive for
      #{20 * seconds_per_year} seconds,"
puts "and if you make it to 100, you will have lived
     #{100 * seconds_per_year} seconds. Make them count!"
