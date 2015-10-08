### Questions

**1) How did you resolve errors detected by Rubocop?**

HOW?! HOW?! With great difficulty...

At first, I had a TON of offenses for creating strings that were wrapped
with double-quotes instead of single-quotes. That was just careless of
me so I fixed most of them quickly.

```
$ guard
00:44:06 - INFO - Inspecting Ruby code style of all files
Inspecting 3 files
C.C

Offenses:

methods_and_recursion/bottles_of_beer.rb:10:1: C: Method has too many lines. [16/10]
def beer_song(number)
^^^
methods_and_recursion/bottles_of_beer.rb:11:81: C: Line is too long. [82/80]
  first_part = "#{number} bottles of beer on the wall, #{number} bottles of beer."
                                                                                ^^
methods_and_recursion/bottles_of_beer.rb:12:16: C: Unnecessary spacing detected.
  second_part =  "Take one down and pass it around, #{number - 1} bottles of beer on the wall."
               ^
methods_and_recursion/bottles_of_beer.rb:12:81: C: Line is too long. [95/80]
  second_part =  "Take one down and pass it around, #{number - 1} bottles of beer on the wall."
                                                                                ^^^^^^^^^^^^^^^
methods_and_recursion/bottles_of_beer.rb:16:25: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
    spacing(first_part, "Take one down and pass it around, 1 bottle of beer on the wall.")
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
methods_and_recursion/bottles_of_beer.rb:16:81: C: Line is too long. [90/80]
    spacing(first_part, "Take one down and pass it around, 1 bottle of beer on the wall.")
                                                                                ^^^^^^^^^^
methods_and_recursion/bottles_of_beer.rb:18:13: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
    spacing("1 bottle of beer on the wall, 1 bottle of beer.",
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
methods_and_recursion/bottles_of_beer.rb:19:13: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
            "Take one down and pass it around, no more bottles of beer on the wall.")
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
methods_and_recursion/bottles_of_beer.rb:19:81: C: Line is too long. [85/80]
            "Take one down and pass it around, no more bottles of beer on the wall.")
                                                                                ^^^^^
methods_and_recursion/bottles_of_beer.rb:21:13: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
    spacing("No more bottles of beer on the wall, no more bottles of beer",
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
methods_and_recursion/bottles_of_beer.rb:22:13: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
            "Go to the store and buy some more, 99 bottles of beer on the wall",
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3 files inspected, 11 offenses detected
```

Those code fixes brought me down to a smaller number of errors, but I noticed that
Rubocop did not like that I had a method with so many lines. I agreed, so I created
two more methods that would output the normal song verses and also automatically add
spaced between lines as they were printed out. For the latter method (spacing), I
added an option to avoid printing out the last space so that the last line of the
song wouldn't have an errant space printed below it that served no purpose.

```
00:44:07 - INFO - Guard is now watching at '/Users/tim/workspace/davinci_coders_t3_2015/homework/learning_by_doing'
00:45:27 - INFO - Inspecting Ruby code style: methods_and_recursion/bottles_of_beer.rb
Inspecting 2 files
CC

Offenses:

methods_and_recursion/bottles_of_beer.rb:10:1: C: Method has too many lines. [17/10]
def beer_song(number)
^^^
methods_and_recursion/bottles_of_beer.rb:11:81: C: Line is too long. [82/80]
  first_part = "#{number} bottles of beer on the wall, #{number} bottles of beer."
                                                                                ^^
methods_and_recursion/bottles_of_beer.rb:14:81: C: Line is too long. [91/80]
            "Take one down and pass it around, #{number - 1} bottles of beer on the wall.")
                                                                                ^^^^^^^^^^^
methods_and_recursion/bottles_of_beer.rb:20:81: C: Line is too long. [85/80]
            'Take one down and pass it around, no more bottles of beer on the wall.')
                                                                                ^^^^^

2 files inspected, 4 offenses detected
```

After a bit of tweaking, I got the code to pass the tests and I was quite happy with
the methods I had written. EXCEPT, I was stuck with a pesky Rubocop telling me that
many of my lines of code were too long because of how long the song verses are.

```
01:22:31 - INFO - Inspecting Ruby code style: methods_and_recursion/bottles_of_beer.rb
Inspecting 2 files
CC

Offenses:

methods_and_recursion/bottles_of_beer.rb:16:81: C: Line is too long. [82/80]
  first_part = "#{number} bottles of beer on the wall, #{number} bottles of beer."
                                                                                ^^
methods_and_recursion/bottles_of_beer.rb:18:81: C: Line is too long. [96/80]
    second_part = "Take one down and pass it around, #{number - 1} bottles of beer on the wall."
                                                                                ^^^^^^^^^^^^^^^^
methods_and_recursion/bottles_of_beer.rb:20:81: C: Line is too long. [83/80]
    second_part = 'Take one down and pass it around, 1 bottle of beer on the wall.'
                                                                                ^^^
methods_and_recursion/bottles_of_beer.rb:32:81: C: Line is too long. [85/80]
            'Take one down and pass it around, no more bottles of beer on the wall.')
                                                                                ^^^^^
methods_and_recursion/bottles_of_beer.rb:34:81: C: Line is too long. [81/80]
            'Go to the store and buy some more, 99 bottles of beer on the wall.',
                                                                                ^

2 files inspected, 5 offenses detected
```

Ultimately, I decided to ignore these errors and continue with my exercises.
Here's my reasoning. I probably could have tinkered with the code to shorten
those lines somehow. But the solution wasn't immediately obvious. Using the `\`
to concatenate strings was causing more issues as many of my methods went over
the Rubocop-preferred 10 line limit for methods. 

More importantly, I think it's fair to consider why Rubocop is asking for lines
of code to be within 80 characters wide. Having code that spills over 80
characters may be hard to read and interpret. However, I think given the context
of the song and the methods created to print out the lyrics, this limit isn't
of any real concern. It is quite clear that certain lines contain a long
song verse that cannot fit within 80 characters easily. Any more tinkering,
either by concatenating strings or trying to swap out phrases with some variable
might actually make it harder to read the code because the song lyrics are
so identifiable and easy to read.
