#!/usr/bin/env ruby

# BAKE ALL THE THINGS!!!
class Oven
  def initialize
    @temp = 80
    @filth = 0
    @door = 'close'
    @burnt = Time.new + 60*60 # Just so things aren't already burnt
  end

  # Print the current temperature

  def temp
    puts "Temperature: #{@temp} °F"
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

  def self_clean
    heat_up(700, :fast)
    puts "Your oven is now self_cleaning. Do not open the door."
    5.times do
      puts '...'
      sleep(1)
    end
    puts 'Your oven is now clean! Please wait for your oven to cool down.'
    cool_down(80, :fast)
    @filth = 0
    @burnt = Time.new + 60*60
  end

  # Opens the door

  def open
    if @door == 'close'
      puts 'You open the door.'
      puts "It's hot in there!" if @temp > 250
      if Time.new >= (@burnt + 10)
        puts 'Whoa! You burned your food!' \
             'Maybe you should take it out and clean the oven.'
      elsif @filth >= 10 && Time.new < (@burnt + 10)
        puts 'Eww...your oven is gross. Maybe you should clean it.'
      end
      @door = 'open'
    else
      puts 'The door is already open.'
      puts 'Whoa! You burned your food! ' +
          'Maybe you should take it out and clean the oven.' if Time.new >= (@burnt + 10)
      puts 'Eww...your oven is gross. Maybe you should clean it.' if (@filth >= 10 && Time.new < (@burnt + 10))
    end
  end

  # Closes the door

  def close
    if @door == 'open'
      puts 'You close the door.'
      @door = 'close'
    else
      puts 'The door is already closed.'
    end
  end

  # Bake some food

  def bake
    if Time.new >= (@burnt + 10) || @filth >= 10
      puts 'Maybe you should clean the oven first...'
    end
    print "Would you like to set a timer? Reply 'yes' or 'no' --> "
    reply = gets.chomp
    if reply == 'yes'
      print 'Please set the timer in minutes --> '
      time_set = gets.chomp.to_i
      @timer = format_time(time_set)
      puts "The alarm will sound in #{time_set} minutes."
      sleep(@timer)
      puts "\aDING! Your food is ready! Don't forget to turn off the oven."
    else
      @burnt = Time.new
    end
    @filth += rand(1..4)
  end

  # Set a temperature that you want for baking. The oven will
  # heat up or cool down to reach that temperature.

  def select_temp(temp)
    if @temp < 80
      puts 'Your oven cannot go lower than room temperature.'
      puts 'Please try and set a new temperature.'
    elsif @temp < temp
      heat_up(temp)
    elsif @temp > temp
      puts 'Your oven is still hot.'
      puts 'Please wait for it to cool down before baking again.'
      cool_down(temp)
      puts "Your oven is now holding at #{@temp} °F."
    else
      puts "Your oven is already holding at #{@temp} °F."
    end
  end

  # Turns the oven off and cools to 80 F

  def off
    cool_down(80)
    puts 'Your oven is fully cooled down.'
  end

  # Heats up the oven

  def heat_up(temp, speed = :regular)
    how_fast = {regular: 50, fast: 100}
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
    how_fast = {regular: 50, fast: 100}
    while @temp > temp
      @temp -= how_fast[speed]
      sleep(1)
      @temp = temp if @temp < temp
      puts "Temperature: #{@temp} °F"
    end
  end
end
