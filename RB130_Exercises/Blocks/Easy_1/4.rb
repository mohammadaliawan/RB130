=begin
- write a method
- given a positive integer
- return a list of all divisors of given integer
- returned list can be in any order
- divisors == factors == all integers on which the given integer is divisible
- must include 1 and the given integer

input: integer
output: array of integers

DS:
input: integer
output: array of integers
intermediate: range

Algo:
- create a new result array
- interate from 1 to the given integer/2
  - if given integer is divisible by current integer
    - append current integer to the result array
- append given integer to the result array
- return result array

- is divisible
    - remainder of dividing given integer by current int is zero
    - use %


revised algo:

- given a postive integer
- 

=end

# def divisors(int)
#   (1..(int/2)).to_a.select { |cur_num| (int % cur_num) == 0 }.push(int)
# end

def divisors(int)

end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357) ==  [1, 999979, 999983, 999962000357]