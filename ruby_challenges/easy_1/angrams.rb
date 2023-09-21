=begin
Write a program that takes a word and a list of possible anagrams
and selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like
"enlists", "google", "inlets", and "banana", the program should return a 
list containing "inlets". 

Please read the test suite for the exact rules of anagrams.

# Understand the Problem
- Program takes a word and list of possible anagrams
- selects the correct sublist 
- that contains the anagrams of the given word
- the program should return a list even if there is only one anagram

# Examples/Testcases
Class: Anagram
- constructor
  - takes one argument string
  - stores as the string to be compared to
- match
  - takes one argument -> list of strings
  - return a list of anagram strings
  - returns [] if no match
  - returns one string in an array if only one match
  - duplicates count as many times as they appear
  - identical words are not anagrams, even if in different case
  - not an anagram if checksum is same
  - strings that contain a subset of the chars in the detector string
  are not anagrams
  - anagrams are case insensitive

# DS
Class: Anagram
  Constructor:
    - input: string
    - @string = string
  match
    - input: array
    - output: array

- 'master' -> %w(stream pigeon maters)
- aemrst -> 


  # Algo
- an anagram is word that contains the same chars but in a different order
  - given a string and an array of strings
  - 



=end



