# Problem
# Write a method that takes a sorted array of integers as argument
# input: an array of integers in ascending order
# returns a array 
# that includes all of the missing integers 
# in order

# returns a new array
# in order: the missing numbers are in ascending order

# Algo
# Given a sorted array of integers
# iterate from first integer to the last integer in the array
# if the current integer is in the given array move to the next integer
# if not, then store that integer in a new array

def missing(given_ary)
  missing_num = ((given_ary.first)...(given_ary.last)).select {|num| !given_ary.include?(num)}
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []