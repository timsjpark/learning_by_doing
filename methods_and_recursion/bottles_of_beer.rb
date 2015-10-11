#!/usr/bin/env ruby

# WARNING! - LineLength cop disabled for this program to account
# WARNING! - for long strings in line 32.
# rubocop:disable Metrics/LineLength

# Create method to automatically add spacing between lines

def spacing(first, second, option = true)
  puts first
  puts ''
  puts second
  puts '' if option == true
end

# Method to print out first part of each verse. Prints out 'bottle'
# when the number of bottles is 1. If number argument is a string,
# like 'no more' at the end of the song, pluralize_first will
# capitalize the first iteration of the string.

def pluralize_first(number, bottle = 'bottles')
  bottle = 'bottle' if number == 1
  written_number = number
  "#{written_number.to_s.capitalize} #{bottle} of beer on the wall, " \
  "#{written_number} #{bottle} of beer."
end

# Method to print out second part of verse. Prints out 'bottle' if
# the verse refers to 1 bottle left (number == 2) and 'no more bottles'
# when there are no bottles left (number == 1). Also, it prints out a
# special line at the very end of the song.

def pluralize_second(number, bottle = 'bottles', remaining = number - 1)
  bottle = 'bottle' if number == 2
  remaining = 'no more' if number == 1
  if number == 0
    'Go to the store and buy some more, 99 bottles of beer on the wall.'
  else
    "Take one down and pass it around, #{remaining} #{bottle} of beer on the wall."
  end
end

# Method for normal song output

def normal_song_verse(number)
  spacing(pluralize_first(number),
          pluralize_second(number))
end

# Print out song output normally and recursively execute method until
# number == 0. Then print out special end of song output and EXIT.

def beer_song(number = 99)
  if number == 0
    spacing(pluralize_first('no more'),
            pluralize_second(number),
            false)
    exit
  end
  normal_song_verse(number)
  beer_song(number - 1)
end

puts beer_song
