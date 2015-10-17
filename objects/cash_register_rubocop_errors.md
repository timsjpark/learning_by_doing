### Questions

**1) How did you resolve errors detected by Rubocop?**

I simply added a comment in the line above the new class `CashRegister`. I then
researched the purpose of top-level documentation and came across an article
about how to use [rdoc](https://en.wikibooks.org/wiki/Ruby_Programming/RubyDoc)
to create a new directoy, `doc`, which contains documentation files about your
new class. Pretty neat! To take full advantage of it, I added comments for each
method to explain their function.

```
$ guard
objects/cash_register.rb:3:1: C: Missing top-level class documentation comment.
class CashRegister
^^^^^

1 file inspected, 1 offense detected
```
