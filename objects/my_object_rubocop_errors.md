### Questions

**1) How did you resolve offenses detected by Rubocop?**

By bashing my head into the wall.

I was careless and ignored all of Rubocop's warning until I was happy
with the code I had written. I realize now that this was a mistake. If
I had addressed the offenses it detected while I was writing the code,
I could probably have avoided a lot of headache trying to keep track of
my work. But oh well, you live and you learn.

The biggest mistakes were that I had lines and methods that were too
long. Obviously, I knew this was going to be a problem as I was coding,
but I thought if I could get the code working first, it might be easier
to deal with the length of the methods later. In hindsight, I wish I had
just been a little bit more deliberate and mindful during the process.

The little offenses I fixed easily and the methods...well that just took
a little bit of time and another Ruby file to store some methods to call.

```
$ guard
23:36:19 - INFO - Inspecting Ruby code style of all files
Inspecting 4 files
..CC

Offenses:

numbers_letters_and_variables/number_of_seconds.rb:22:7: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
print "and if you make it to 100, you will have lived "
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
objects/my_object.rb:4:1: C: Class has too many lines. [147/100]
class SassyOven
^^^^^
objects/my_object.rb:9:27: C: Surrounding space missing for operator *.
    @burnt = Time.new + 60*60 # Just so things aren't already burnt
                          ^
objects/my_object.rb:20:3: C: Method has too many lines. [11/10]
  def self_clean
  ^^^
objects/my_object.rb:23:10: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
    puts "Your oven is now self_cleaning. Do not open the door."
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
objects/my_object.rb:31:27: C: Surrounding space missing for operator *.
    @burnt = Time.new + 60*60
                          ^
objects/my_object.rb:36:3: C: Assignment Branch Condition size for open is too high. [24.37/15]
  def open
  ^^^
objects/my_object.rb:36:3: C: Cyclomatic complexity for open is too high. [9/6]
  def open
  ^^^
objects/my_object.rb:36:3: C: Method has too many lines. [16/10]
  def open
  ^^^
objects/my_object.rb:36:3: C: Perceived complexity for open is too high. [11/7]
  def open
  ^^^
objects/my_object.rb:50:81: C: Line is too long. [90/80]
           'Maybe you should take it out and clean the oven.' if Time.new >= (@burnt + 10)
                                                                                ^^^^^^^^^^
objects/my_object.rb:51:70: C: Don't use parentheses around the condition of an if.
      puts 'Eww...your oven is gross. Maybe you should clean it.' if (@filth >= 10 && Time.new < (@burnt + 10))
                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
objects/my_object.rb:51:81: C: Line is too long. [111/80]
      puts 'Eww...your oven is gross. Maybe you should clean it.' if (@filth >= 10 && Time.new < (@burnt + 10))
                                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
objects/my_object.rb:61:81: C: Line is too long. [87/80]
        puts "You're just going to ignore the mess? I hope your wife doesn't see it..."
                                                                                ^^^^^^^
objects/my_object.rb:103:3: C: Method has too many lines. [13/10]
  def bake
  ^^^
objects/my_object.rb:105:81: C: Line is too long. [87/80]
      puts "Please put your food in the oven and close the door by typing 'close' --> "
                                                                                ^^^^^^^
objects/my_object.rb:121:3: C: Assignment Branch Condition size for bake_method is too high. [20.15/15]
  def bake_method
  ^^^
objects/my_object.rb:121:3: C: Method has too many lines. [16/10]
  def bake_method
  ^^^
objects/my_object.rb:143:3: C: Method has too many lines. [13/10]
  def select_temp(temp)
  ^^^
objects/my_object.rb:169:16: C: Space inside { missing.
    how_fast = {regular: 50, fast: 100}
               ^
objects/my_object.rb:169:39: C: Space inside } missing.
    how_fast = {regular: 50, fast: 100}
                                      ^
objects/my_object.rb:182:16: C: Space inside { missing.
    how_fast = {regular: 50, fast: 100}
               ^
objects/my_object.rb:182:39: C: Space inside } missing.
    how_fast = {regular: 50, fast: 100}
                                      ^

4 files inspected, 23 offenses detected
```
