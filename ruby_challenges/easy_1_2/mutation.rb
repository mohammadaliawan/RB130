=begin
Write a program that can calculate the Hamming distance between two DNA strands.

point mutation -> which replaces one base with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor,
we get a measure of the minimum number of point mutations that could have occurred

This is called the Hamming distance.

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal length.
If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.

Explicit Requirements:

- A program that can calculate the hamming distance between two DNA strands

- pojnt mutations are which replace one base with another at a single point
- Hamming distance: minimum number of point mutations: number of differences between two strands
- given two DNA strands, strings with uppercase alphabetic chars
  - hamming distance is the number of positions at which the chars are different in both
- hamming distance is calculated for strands of equal length
- if unequal length strands are given, hamming distance to be calcualted over the shorter length
- sequences will be provided as a string of chars

Implicit requirements:
- a class named DNA
  - Constructor takes one argument a string
  - all chars should be uppercase in the provided string
- instance method #hamming_distance
  - takes one argument a string
  - returns 0 for empty strings
  - returns 0 for identical strings
  - returns hamming distance for short strands of atleast three chars
  - returns haming distance when argument string is longer by 1 char (long strands of more than 30 chars)
  - return haming distance for sequences that have a differnce somewhere in the middle
  - if argument string is longer ignore extra length of arg string
  - if calling sequence is longer, ignore extra length
  - does not change the calling sequence

Data Structures:

DNA Objects:
- has a @seq attribute that is an string of chars 
- convert that to a array of chars -> can be mutated without mutating the original string
- convert argument string into an array of chars, easy to iterate

Hamming distance Algorithm:
- Given two strings of differing or equal lengths
- find the shorter string
- initialize a hamming distance counter to 0
- iterate from index 0 to index = number of chars in shorter string - 1
  - if char at current index in calling string is not equal to char at current index in provided string
    - increment hamming counter by 1
  - otherwise, go to next char
- return the counter
=end

class DNA
  def initialize(sequence)
    @seq = sequence
  end

  def hamming_distance(other_sequence)
    hamming_counter = 0

    shorter_seqence = @seq.size < other_sequence.size ? @seq : other_sequence

    shorter_seqence.size.times do |index|
      if @seq[index] != other_sequence[index]
        hamming_counter += 1
      end
    end

    return hamming_counter
  end

end

dna = DNA.new("")

p dna.hamming_distance("")