class Octal
  OCTAL_DIGITS = {
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7
  }

  def initialize(str)
    unless str.match(/[^0-7]/)
      @value = str
    else
      @value = '0'
    end
  end

  def to_decimal
    nums = @value.chars.map { |dig| OCTAL_DIGITS[dig] }

    index = 0
    sum = 0

    nums.reverse.each do |num|
      sum += num * (8**index)
      index += 1
    end

    sum
  end
end
