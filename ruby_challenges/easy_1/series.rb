=begin
Explicit Rules:
- given a string of digits
- find all consective number series of given length
- '01234' -> '012', '123', '234
- raise an error if substring length is more than given string length

Implicit Rules:
- Class Series
  - #initialize(one string arg)
  - #slices(length of substring as an integer)
    - returns an array of arrays where each inner array is a possible series of consective digits
    - array needs to be in the same order as the string
    - preceding 0 still counts towards the series
    - raise ArgumentError for series length greater than given string length

"01234", 3 -> '012', '123', '234' -> ['0', '1', '2'], [...], 

  #slices
  - given a string of length given_length
  - given a length of required series series_length
  - find all the possible substring of series_length
    - iterate thru startiong index 0..(str_length - substring length)
      - get the substring with startingindex and series_length
  - convert the substrings to arrays of chars
  - transform the array of chars to arrays of integers
  - return array of integer arrays
=end

require 'minitest/autorun'

class Series
  def initialize(str)
    @digits_str = str
  end

  def slices(series_length)
    raise ArgumentError if series_length > @digits_str.size
    
    (0..(@digits_str.size - series_length)).map do |index|
       @digits_str[index,series_length].chars.map { |char| char.to_i }
    end
  end
end