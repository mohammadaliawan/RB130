=begin
Write a program that, given a word, computes the Scrabble score for that word.

Letter Values

A, E, I, O, U, L, N, R, S, T -> 1
D, G                         -> 2
B, C, M, P                   -> 3
F, H, V, W, Y                -> 4
K                            -> 5
J, X                         -> 8
Q, Z                         -> 10

How to Score

Sum the values of all the tiles (letters)used in each word.

'CABBAGE'

3 points for C
1 point for each A (there are two)
3 points for B (there are two)
2 points for G
1 point for E

3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14

Explicit Rules:

- input: a word(string)
  - A look up table of values for each letter
  - All are uppercased letters in the lookup table

- Output: Scrabble Score -> integer
  - Score is calculated by summing the values of all letters in a word

Implicit Rules:

- If a letter occurs more than once, multiply the value of that letter as many times
- Class: Scrabble
- methods:
-  A constructor that takes one argument (string- alphabetic chars
whitespace chars, \t, \n, nil are allowed)
    - argument string to be saved as state of the Scrabble Object to access later
- #score => scrabble score
  - empty string score => 0
  - white space from tabs and new line and single spaces -> 0
  - nil => 0
  - single letter words => score for that letter
  

Questions:
  - what about lowercase letters? case-insensitive ->
    -  lowercase letters have the same score as uppercase
  - What about nonalphabetic chars?
    - no nonalphabetic chars will be in the input (assumption)


DS:
the input string can be saved as an array of chars
remove white spaces from the string if any
values stored in a look up hash with keys as letters(downcased)=> value
  'letter' => value

Algorithm:

Constructur:
input: one string
convert nil to empty string
remove whitespaces from the given word
convert to all downcase
convert the given word into an array of chars ['a', 'p', 'p']
save the array as an instance variable

#score
Given a word (string) containing alphabetic chars(upper/lower) and whitespaces
make a look up table for letter scores
transform the array of letters to array of letter scores
sum the scores in the array to get total score

=end

class Scrabble
  LOOK_UP_TABLE = {
    %w(a e i o u l n r s t) => 1,
    %w(d g)                 => 2,
    %w(b c m p)             => 3,
    %w(f h v w y)           => 4,
    %w(k)                   => 5,
    %w(j x)                 => 8,
    %w(q z)                 => 10
  }
  def initialize(given_word)
    @word = given_word.to_s.split.join.downcase.chars
  end

  def self.score(word)
    scrabble_object = self.new(word)
    scrabble_object.score
  end
  
  def score
   letter_scores = @word.map do |letter|
      LOOK_UP_TABLE.each do |key, value|
        break value if key.include?(letter)  
      end
    end

    letter_scores.sum
  end
end
