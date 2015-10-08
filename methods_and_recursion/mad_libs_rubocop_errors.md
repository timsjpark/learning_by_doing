### Questions

**1) How did you resolve offenses detected by Rubocop?**

I left an extra white space between my method name and the list of parameters
it takes in line 3 so I fixed it easily.

```
00:01:32 - INFO - Inspecting Ruby code style: methods_and_recursion/mad_libs.rb
Inspecting 1 file
C

Offenses:

methods_and_recursion/mad_libs.rb:3:13: C: Do not put a space between a method name and the opening parenthesis.
def get_word (part_of_speech)
            ^

1 file inspected, 1 offense detected
```
