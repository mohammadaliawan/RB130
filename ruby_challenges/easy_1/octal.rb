=begin
Implement octal to decimal conversion. Given an octal input string, 
your program should produce a decimal output.
Treat invalid input as octal 0.

Decimal is a base-10 system. A number 233 in base 10 notation
can be understood as a linear combination of powers of 10

The n*th* digit gets multiplied by 10n-1.

Octal numbers are similar, but they use a base-8 system. A number 
233 in base 8 can be understood as a linear combination of powers of 8

The n*th* digit gets multiplied by 8n-1

Explicit Rules/Requirements
- Input: string representing an octal number
- invalid inputs are considered octal 0
- Output: Decimal output

Implicit Rules:
- Class Octal
- #initialize(one argu string)
  - @value
  - valid chars: 0-7, any string preceded by a zero, zero will be ignored
  - non valid inputs are considered octal 0 and return decimal 0
  - invalid: strings containing all alphabatic chars, 
        - strings containing only non octal digits like 8 and 9
        - string ending in non octal digits
        - strings starting or ending in non octal chars
- #to_decimal
  - returns the decimal equivalent of the @value
- #convert_to_octal_num
  - returns the string converted to an integer base 8

Algo:
#initialize:
- input: string of alphanumeric chars
- if the input string contains any non octal chars
  - @value of the octal object = 0
- otherwise, @value = input string

#to_decimal
- given a valid octal num string
- convert the string to an array of integers with base 8
  - convert the string to array of chars
  - transform the array of chars to array of integers
- convert the base 8 integer array to base 10 integer

=end

class Octal
  OCTAL_DIGITS = {"0"=>0,"1"=>1,"2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>7}

  def initialize(str)
    unless str.match(/[^0-7]/)
      @value = str 
    else
      @value = '0'
    end
  end

  def to_decimal
    nums = @value.chars.map { |dig| OCTAL_DIGITS[dig]}

    index = 0
    sum = 0

    nums.reverse.each do |num|
      sum += num * (8**index)
      index += 1
    end

    sum
  end
end