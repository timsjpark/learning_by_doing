#!/usr/bin/env ruby

# Create method to automatically add spacing between lines

def spacing(first, second, option = true)
  puts first
  puts ''
  puts second
  puts '' if option == true
end

# This method prints out the normal second_verse. It accounts for the
# special verse when number == 1  and print 'no more bottles' instead
# of '0 bottles'. At the very end of the song when number == 'no more',
# it prints a special end verse.

# Disable Rubocop for this method to account for long string on line 23
# rubocop:disable Metrics/LineLength
def second_verse(number, bottle_2)
  if number == 'no more'
    'Go to the store and buy some more, 99 bottles of beer on the wall.'
  else
    if number > 1
      remaining = number - 1
    else
      remaining = 'no more' if number == 1
    end
    "Take one down and pass it around, #{remaining} #{bottle_2} of beer on the wall."
  end
end
# rubocop:enable Metrics/LineLength

# This method passes true to the option argument in the spacing method
# except for at the end of the song (number == 'no more')

def option(number)
  if number == 'no more'
    false
  else
    true
  end
end

# The print_lyrics method outputs one set of verses from the song,
# '99 bottles of beer'. Given a number, it will print out the song
# lyrics and account for writing 'bottle' in singular form when
# the song refers to just 1 bottle.
#
# It also accounts for the case  of 0 bottles, and prints out 'no more'
# instead of the number. Pay attention that number is re-assigned the
# value 'no more' when the 'number' argument == 0. As such, the
# second_verse and option methods evaluate if number == 'no more' and
# not if number == 0

def print_lyrics(number, bottle_1 = bottle_2 = 'bottles')
  bottle_2 = 'bottle' if number == 2
  bottle_1 = 'bottle' if number == 1
  number = 'no more' if number == 0 # number variable is re-assigned
  first = "#{number.to_s.capitalize} #{bottle_1} of beer on the wall, " \
          "#{number} #{bottle_1} of beer."
  second = second_verse(number, bottle_2)
  option = option(number)
  spacing(first, second, option)
end

# Print out song lyrics recursively and exit when number == 0

def beer_song(number = 99)
  print_lyrics(number)
  exit if number == 0
  beer_song(number - 1)
end

# Print the song, computer! Dance, monkey!

puts beer_song
