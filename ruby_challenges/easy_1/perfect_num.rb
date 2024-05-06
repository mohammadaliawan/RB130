=begin
Write a program that can tell whether a number is perfect, abundant, or deficient.

abundant, perfect, or deficient based on a comparison between 
the number and the sum of its positive divisors
This sum is known as the Aliquot sum

Perfect numbers have an Aliquot sum that is equal to the original number.
Abundant numbers have an Aliquot sum that is greater than the original number.
Deficient numbers have an Aliquot sum that is less than the original number.

positive divisors (the numbers that can be evenly divided
into the target number with no remainder, 
excluding the number itself)

For instance, the positive divisors of 15 are 1, 3, and 5
Prime numbers 7, 13, etc. are always deficient since their only divisor is 1

Explicit Rules/Requirements:

- Input: a natural number i.e. an integer
- output: perfect, abundant, deficient
- based on comparison between the number and its Aliquot sum
- Aliquot sum: sum of the numbers positive divisors
- positive divisors include: 1
- postive divisors do not include: the number itself
- positive divisors: remainder of division by the divisor is zero,
- prime numbers are always deficient

Implicit Requirements:
- Class PerfectNumber
- ::classify:
  - input: Raise StandardError if input is a negative number
  - input: positive integers only
  - output: deficient, perfect, abundant strings

DS: input: integer
output: string
divisors: array
=end

class PerfectNumber
  def self.classify(num)
    raise StandardError if num <= 0

    if divisors(num).sum < num
      "deficient"
    elsif divisors(num).sum > num
      "abundant"
    else
      "perfect"
    end
  end

  def self.divisors(num)
    (1..num/2).select { |int| num % int == 0}
  end
end