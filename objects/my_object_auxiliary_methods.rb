#!/usr/bin/env ruby

require_relative 'my_object'

# If you allow the oven to self_clean, this method let's some time pass
# after the oven is heated to 700 F so that it can clean itself.

def self_clean_step
  5.times do
    puts '...'
    sleep(1)
  end
end

# If your oven is gross and dirty, it will remind you.

def if_the_oven_is_gross
  if Time.new >= (@burnt + 10)
    puts 'Whoa! You burned your food! ' \
         'Maybe you should take it out and clean the oven.'
  elsif @filth >= 10 && Time.new < (@burnt + 10)
    puts 'Eww...your oven is gross. Maybe you should clean it.'
  end
end

# Takes timer settings and reduces it to 1/10th of the original
# time because this is a fake Oven and I don't want you to wait
# 60 real minutes for a prompt. Ain't nobody got time for that!

def format_time(time)
  if (time % 10) >= 5
    round = 1
  else
    round = 0
  end
  (time / 10) + round
end

# This method will remind you when your food is ready and prevent any burning

def timed_bake_method
  print 'Please set the timer in minutes --> '
  time_set = gets.chomp.to_i
  @timer = format_time(time_set)
  puts "The alarm will sound in #{time_set} minutes."
  sleep(@timer)
  puts "\aDING! Your food is ready! Don't forget to turn off the oven."
end

# Bake some food. Asks if you want to set a timer or not. If you do, the oven
# will remind you when food is cooked. If not, it will let the food burn until
# it is but a pitiful charred husk of its former self.

def bake_process
  print "Would you like to set a timer? Reply 'yes' or 'no' --> "
  if gets.chomp == 'yes'
    timed_bake_method
  else
    @burnt = Time.new
  end
  @filth += rand(1..4)
end

# Tests to see if the oven door is closed before allowing you to bake

def closed_door_test
  index = 1
  while @door == 'open'
    puts 'Baking will not begin until you close the door.' if index >= 3
    puts 'Please put your food in the oven and ' \
         'close the door by typing close --> '
    @door = 'close' if gets.chomp == 'close'
    index += 1
  end
end

# Heats up the oven

def heat_up(temp, speed = :regular)
  how_fast = { regular: 50, fast: 100 }
  while @temp < temp
    @temp += how_fast[speed]
    sleep(1)
    @temp = temp if @temp > temp
    puts "Temperature: #{@temp} °F"
  end
  puts "Your oven is now holding at #{@temp} °F."
end

# Cools down the oven

def cool_down(temp, speed = :regular)
  how_fast = { regular: 50, fast: 100 }
  while @temp > temp
    @temp -= how_fast[speed]
    sleep(1)
    @temp = temp if @temp < temp
    puts "Temperature: #{@temp} °F"
  end
  puts "Your oven is now holding at #{@temp} °F."
end
