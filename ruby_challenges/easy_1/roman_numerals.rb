# P
# Write some code that converts modern decimal numbers into their Roman number equivalents.
# I = 1
# II = 2
# III = 3
# iV = 4
# V = 5
# VI = 6
# VII = 7
# iX = 9
# X = 10
# ROMAN = {1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L', 100 => 'C', 500 => 'D', 1000 => 'M'}

# (1..3) -> number * numeral for 1
# (4..8) -> if < 5 -> numeral for 1 + for 5
# (9) -> IX


# TENS
# (1..3) -> number * numeral for 10
# (4..8) -> if < 5 => numeral for 10 + for 50
#       -> if > 5 => for 50 + numeral for 10 * difference
# 9 -> XC

# Hundreds
# (1..3) -> number * numeral for 100
# (4..8) -> if < 5 => numberal for 100 + 500
#       -> if > 5 => for 500 + number for 100 * difference

# Thousands
# (1..3) -> number * M

# class: Roman Numeral
# method: constructor accepts one argument integer
# to_roman -> returns a string containing roman numerals

# constructor
  # accepts one integer
  # stores for later use

# to_roman
  # given an integer
  # determine the number of thousands, hundreds, tens and units
  # create a look up dictionary for major roman numerals
  # determine the roman numeral for number of thousands
  # determine the roman numeral for number of hundreds
  # determine the roman numeral for number of tens
  # determine the roman numeral for number of units
  # Concatenate all the roman numerals from left to right

class RomanNumeral
  ROMAN = {0 => '', 1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L', 100 => 'C', 500 => 'D', 1000 => 'M'}
  attr_reader :value

  def initialize(int)
    @value = int
    @thousands = thousands
    @hundreds = hundreds
    @tens = tens
    @units = units
  end

  def thousands
    value / 1000
  end

  def hundreds
    (value % 1000) / 100
  end

  def tens
    (value % 100) / 10
  end

  def units
    value.to_s.chars.last.to_i
  end

  def to_roman
    numeral_for_thousands + numeral_for_hundreds + numeral_for_tens + numeral_for_units
  end

  def numeral_for_placevalue
    case @hundreds
    when 0..3
      ROMAN[100] * @hundreds
    when 4
      ROMAN[100] + ROMAN[500]
    when 5
      ROMAN[500]
    when 6..8
      ROMAN[500] + ROMAN[100] * (@hundreds - 5)
    when 9
      ROMAN[100] + ROMAN[1000]
    end
  end

  def numeral_for_thousands
    ROMAN[1000] * @thousands
  end

  def numeral_for_hundreds
    case @hundreds
    when 0..3
      ROMAN[100] * @hundreds
    when 4
      ROMAN[100] + ROMAN[500]
    when 5
      ROMAN[500]
    when 6..8
      ROMAN[500] + ROMAN[100] * (@hundreds - 5)
    when 9
      ROMAN[100] + ROMAN[1000]
    end
  end

  def numeral_for_tens
    case @tens
    when 0..3
      ROMAN[10] * @tens
    when 4
      ROMAN[10] + ROMAN[50]
    when 5
      ROMAN[50]
    when 6..8
      ROMAN[50] + ROMAN[10] * (@tens - 5)
    when 9
      ROMAN[10] + ROMAN[100]
    end
  end

  def numeral_for_units
    case @units
    when 0..3
      ROMAN[1] * @units
    when 4
      ROMAN[1] + ROMAN[5]
    when 5
      ROMAN[5]
    when 6..8
      ROMAN[5] + ROMAN[1] * (@units - 5)
    when 9
      ROMAN[1] + ROMAN[10]
    end
  end


end

p RomanNumeral.new(1506).numeral_for_tens





