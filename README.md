# austinrb-coding-challenge

## Problem
As you may know, numbers can be categorized as either odd, even, or neither (zero). Strings do not have this property about them. For this challenge we will come up with a way to classify strings as either odd, even, or neither. 

A string is considered even if every letter in the string appears an even number of times. The string is considered odd if every letter in the string appears and odd number of times. And in the case when there are the same number of "odd" letters and "even" letters the string is classified as neither. 

Given a string determine whether the string is "odd", "even", or "neither"

We all know chatgpt, claudie, copilot, and all other AI tools can probably solve this pretty easily. But that wouldn't be very fun. Try to use your brain like the good old days and plain old ruby to tackle this one.

### Input
The input will only consist of lower case letters [a-z]. There will be no numbers, symbols, spaces, tabs or other pesky characters you have to worry about. The input will always be at least 1 letter, but can range to be a very long string. Use some of the sample string below to get the hang of the problen. Then when you are ready try to classify the-book.txt. 

### Output
The output should consist of a single word, (odd|even|neither).

### Challenge 1
Solve the problem! Just get it correctly classifying strings of smaller size.

### Challenge 2
How efficiently can you solve the problem. Efficiently meaning, time it takes to classify the string and the amount of memory the process took to do so.

### Samples

|       Input      | Output  |
| -----------------|---------|
| a                | odd     |
| aa               | even    |
| abab             | even    |
| caab             | odd     |
| baabc            | even    |
| aadcbb           | neither |
------------------------------