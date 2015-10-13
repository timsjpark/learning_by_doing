#!/usr/bin/env ruby

# Create method to automatically add spacing between lines

def spacing(first, second, option = true)
  puts first
  puts ''
  puts second
  puts '' if option == true
end

# Modify certain parts of the song lyrics depending on special cases. For
# example, the lyrics should read '1 bottle' and not '1 bottles'. At the
# end of the song, print a special second verse instead of the normal one.

def modify(string)
  string.sub!(/^0/, 'No more')
  string.sub!(/, 0/, ', no more')
  # Disable LineLength cop momentarily
  # rubocop:disable Metrics/LineLength
  string.sub!(/.*-1.*/, 'Go to the store and buy some more, 99 bottles of beer on the wall.')
  # rubocop:enable Metrics/LineLength
  string
end

def pluralize(number, verse)
  bottle = 'bottles'
  if number == 2 && verse == 2
    bottle = 'bottle'
  elsif number == 1 && verse == 1
    bottle = 'bottle'
  end
  bottle
end

# Print the proper song lyrics based on the number of bottles

def print_lyrics(number)
  puts first = modify("#{number} #{pluralize(number, 1)} of beer on the wall, #{number} #{pluralize(number, 1)} of beer.")
  puts ''
  # Disable LineLength cop momentarily
  # rubocop:disable Metrics/LineLength
  puts second = modify("Take one down and pass it around, #{number - 1} #{pluralize(number, 2)} of beer on the wall.")
  # rubocop:enable Metrics/LineLength
  exit if number == 0
  puts ''
end

# Print out song lyrics recursively and exit when number == 0

def beer_song(number = 99)
  print_lyrics(number)
  exit if number == 0
  beer_song(number - 1)
end

# Print the song, computer! Dance, monkey!

puts beer_song
