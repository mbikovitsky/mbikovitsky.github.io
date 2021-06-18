Welcome to the house of horrors!

-> intro

=== intro ===
In front of you, you can see a table.

+ {not table_first_time} [Examine the table] -> table_first_time
+ {table_first_time} [Examine the table] -> table_second_time


=== table_first_time ===
Dammit, Jim! I'm a web page, not a descriptionist!

+ [Fine] -> intro


=== table_second_time ===
On the table is an old book. Filled with arcane knowledge, by the looks of it.

+ [Read it] You flip through the book, trying to find anything of interest. -> book


=== book ===
* [Read page 1337] -> page_1337
+ [Put the book down] -> END


=== page_1337 ===

You find the following statements:

1) 2 + 2 = { 2 + 2 }
2) 10 % 3 = { 10 % 3 }
3) 2 ** 31 = { INT(POW(2, 31)) }
4) 2 ** 63 = { INT(POW(2, 63)) }

-> book
