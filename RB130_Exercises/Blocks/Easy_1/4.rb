# write a method
# returns a list
# of divisors of the argu
# arg is a positive integer
# return value can be in any sequence

#input: Positive Integer
#output: list of divisors, array

# if there is only one divisor return an array of one element
# The number itself should also be part of the list
# a divisor in this case is a num that divides the given int completely
# 1 will be always be included in the list

# DS
# input: integer
# output: array
# intermediate: range

1 -> [1]
2 -> [1,2]
3
4
5

# Algo
# Given a positive integer
# create a new list result containing the integer 1
# if given integer/2 is greater than 1
  # store given int in the list
  # iterate from 2 to given int/2 if given int/2 is greater than or equal to 2
  # if the current number divides the given integer completely or evenly
  #   store the current number in the list
  # otherwise, move onto the next consec integer
# otherwise, return result list [1]
def divisors(int)
  counter = 1
  result = [1]
  result << int
  loop do
    counter += 1
    break if counter > int
  end 
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357) ==  [1, 999979, 999983, 999962000357]