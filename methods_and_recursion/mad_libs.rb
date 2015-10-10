#!/usr/bin/env ruby

def get_word(part_of_speech)
  puts "Give me #{part_of_speech}:"
  gets.chomp
end

# Create variables to contain strings to pass into get_word method
# in order to avoid receiving warnings from Rubocop.

adj = 'an adjective'
adj_2 = 'another adjective'
noun = 'a noun'
noun_2 = 'another noun'
plu_noun = 'a plural noun'
plu_noun_2 = 'another plural noun'
game = 'a game'
verb_ing = "a verb ending in 'ing'"
verb_ing_2 = "another verb ending in 'ing'"
plant = 'a plant'
body = 'a part of the body'
place = 'a place'
number = 'a number'

puts <<-EOT.sub(/\n$/, '')
Here is your madlib:
A vacation is when you take a trip to some #{get_word(adj)} place
with your #{get_word(adj_2)} family. Usually you go to some place
that is near a/an #{get_word(noun)} or up on a/an #{get_word(noun_2)}.
A good vacation place is one where you can ride #{get_word(plu_noun)}
or play #{get_word(game)} or go hunting for #{get_word(plu_noun_2)}. I like
to spend my time #{get_word(verb_ing)} or #{get_word(verb_ing_2)}.
When parents go on a vacation, they spend their time eating
three #{get_word(plu_noun_2)} a day, and fathers play golf, and mothers
sit around #{get_word(verb_ing_2)}. Last summer, my little brother
fell in a/an #{get_word(noun_2)} and got poison #{get_word(plant)} all
over his #{get_word(body)}. My family is going to go to (the)
#{get_word(place)}, and I will practice #{get_word(verb_ing_2)}. Parents
need vacations more than kids because parents are always very
#{get_word(adj_2)} and because they have to work #{get_word(number)}
hours every day all year making enough #{get_word(plu_noun_2)} to pay
for the vacation.
EOT
