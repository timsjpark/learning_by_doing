#!/usr/bin/env ruby

# WARNING! - LineLength cop disabled for this program to account
# WARNING! - for long strings in lines 20, 22, 24, 36, and 38.
# rubocop:disable Metrics/LineLength

# Create method to automatically add spacing between lines

def spacing(first, second, option = true)
  puts first
  puts ''
  puts second
  puts '' if option == true
end

# Create method for normal song output. If number of bottles > 2, modify
# second part of the verse.

def normal_song_verse(number)
  first_part = "#{number} bottles of beer on the wall, #{number} bottles of beer."
  if number > 2
    second_part = "Take one down and pass it around, #{number - 1} bottles of beer on the wall."
  else
    second_part = 'Take one down and pass it around, 1 bottle of beer on the wall.'
  end
  spacing(first_part,
          second_part)
end

# Print out song output normally and recursively execute method until
# number == 1. Then print out special end of song output and EXIT.

def beer_song(number = 99)
  if number == 1
    spacing('1 bottle of beer on the wall, 1 bottle of beer.',
            'Take one down and pass it around, no more bottles of beer on the wall.')
    spacing('No more bottles of beer on the wall, no more bottles of beer.',
            'Go to the store and buy some more, 99 bottles of beer on the wall.',
            false)
    exit
  end
  normal_song_verse(number)
  beer_song(number - 1)
end

puts beer_song
