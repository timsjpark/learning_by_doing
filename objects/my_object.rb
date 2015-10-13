#!/usr/bin/env ruby

require_relative 'my_object_auxiliary_methods'

# BAKE ALL THE THINGS!!!
class SassyOven
  def initialize
    @temp = 80
    @filth = 0
    @door = 'close'
    @burnt = Time.new + 60 * 60 # Just so things aren't already burnt
  end

  # Print the current temperature

  def temp
    puts "Temperature: #{@temp} °F"
  end

  # Who doesn't like a self-cleaning oven?

  def self_clean
    return 'Maybe you should close the door first.' if @door == 'open'
    heat_up(700, :fast)
    puts 'Your oven is now self_cleaning. Do not open the door.'
    self_clean_step
    puts 'Your oven is now clean! Please wait for your oven to cool down.'
    off
    @filth = 0
    @burnt = Time.new + 60 * 60
  end

  # Opens the door

  def open
    if @door == 'close'
      puts 'You open the door.'
      if_the_oven_is_gross
      @door = 'open'
    else
      puts 'Are you blind? The door is already open.'
      if_the_oven_is_gross
    end
  end

  # Closes the door

  def close
    if @door == 'open'
      puts 'You close the door.'
      if Time.new >= (@burnt + 10) || @filth >= 10
        puts "You're just going to ignore the mess? " \
             "I hope your wife doesn't see it..."
      end
      @door = 'close'
    else
      puts 'Are you blind? The door is already closed.'
    end
  end

  # Set a temperature that you want for baking. The oven will
  # heat up or cool down to reach that temperature.

  # Disable MethodLength cop because select_temp method is only 1 line
  # over the limit and I don't want to break the LineLength rule here.
  # rubocop:disable Metrics/MethodLength
  def preheat(temp)
    puts "Your oven is already holding at #{@temp} °F." if @temp == temp
    if temp < 80
      return 'Your oven is not a fridge and cannot go lower than room ' \
             'temperature. Please try and set a new temperature.'
    elsif @temp < temp
      heat_up(temp)
    elsif @temp > temp
      puts 'Your oven is still hot. ' \
           'Please wait for it to cool down before baking again.'
      cool_down(temp)
    end
  end
  # rubocop:enable Metrics/MethodLength

  # The broil method allows you to cook food at 500 F automatically.

  def broil
    heat_up(500, :fast)
    bake
  end

  # This allows you to bake food. This method should make sure that the door
  # is open first and then use the bake_process method to cook the food.

  def bake
    # Leave me alone Rubocop. I know what I'm doing.
    # rubocop:disable Metrics/LineLength
    return "Please pre-heat the oven. Nothing's going to cook at #{@temp}" if @temp < 200
    # rubocop:enable Metrics/LineLength
    if @door == 'open'
      if Time.new >= (@burnt + 10) || @filth >= 10
        return 'Maybe you should clean the oven first...'
      end
      closed_door_test
      bake_process
    else
      return 'Please open the oven door first.'
    end
  end

  # Turns the oven off and cools to 80 F (room temperature)

  def off
    cool_down(80, :fast)
    puts 'Your oven is fully cooled down.'
  end
end
