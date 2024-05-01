=begin
converts modern decimal numbers into their Roman number equivalent

no need to be able to convert numbers larger than about 3000.

Modern Roman numerals ... are written by expressing each digit 
separately starting with the left most digit and skipping any digit with a value of zero.

Explicit Requirements:
Given: a number in decimal format
Output: Roman number equivalent

- inputs will be less than 3000
- each digit is expressed seperately
- start with the left most digit
- skip any digit that is zero
- i -> 1
- V -> 5
- X -> 10
- L -> 50
- C -> 100
- D -> 500
- M -> 1000

2349 -> 2 thousands, 3 hundreds, 4 tens, 9 ones
- determine the place value of each digit
- Thousands -> 2 * 'M'
- Hundred -> <= 3 -> 3 * C, H = 4 -> CD, 5 < H <= 8 -> DC, DCC, DCCC, 900 -> CM
- tens -> <= 30 > 3 * X , T = 40 -> XL, 50 = L, 50 < T <= 80 -> LX, LXX, LXXX, 90 -> XC

Algorithm:

given decimal number less than 3000
- determine the place values of each digit
  - Thousands = given number / 1000
  - Hundred - given number % 1000 / 100
  - tens = given number % 100 / 10
  - units = given number % 10
- determine the roman equivalent of each digit
- Join the roman equivalents
=end

class RomanNumeral
  def initialize(num)
    @decimal = num
  end

  def to_roman
    units = @decimal % 10
    tens = (@decimal % 100)/10
    hundreds = (@decimal % 1000)/100
    thousands = @decimal/1000
  
    first_digit = 'M' * thousands
    second_digit = determine_hundreds_equivalent(hundreds)
    third_digit = determine_tens_equivalent(tens)
    fourth_digit = determine_units_equivalent(units)
  
    first_digit + second_digit + third_digit + fourth_digit
  end
  
  def determine_hundreds_equivalent(hundreds)
    if hundreds <= 3
      'C' * hundreds
    elsif hundreds == 4
      'CD'
    elsif hundreds == 5
      'D'
    elsif hundreds <= 8
     'D' + 'C' * (hundreds - 5)
    else
      'CM'
    end
  end
  
  def determine_tens_equivalent(tens)
    if tens <= 3
      'X' * tens
    elsif tens == 4
      'XL'
    elsif tens == 5
      'L'
    elsif tens <= 8
     'L' + 'X' * (tens - 5)
    else
      'XC'
    end
  end
  
  def determine_units_equivalent(units)
    if units <= 3
      'I' * units 
    elsif units == 4
      'IV'
    elsif units == 5
      'V'
    elsif units <= 8
     'V' + 'I' * (units - 5)
    else
      'IX'
    end
  end

end



p RomanNumeral.new(27).to_roman