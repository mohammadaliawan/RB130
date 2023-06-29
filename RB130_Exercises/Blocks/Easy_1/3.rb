=begin
Problem Requiremenets 
- Write a method
- takes a sorted array  of integers as argument
- returns an array
- array includes all of the missing integers
  - returned array should also be sorted
- missing integers between first and the last elements of the given array

- returned array should not include the integers in the given array
- if there are no missing integers return an empty array
- if given array has only one integer, return an empty array

  input: array of sorted integers
  output: array of missing integers in order

Examples and test cases:

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

DS:
input: array of integers
output: array of integers
intermediate: range

Algo:
- given an array of sorted integers
- find the first and last integers
- generate an array of all integers between first and last
- select the integers from this array that are not in the given array
  - 


=end

# def missing(int_ary)
#   first = int_ary.first
#   last = int_ary.last

#   # (first..last).to_a.select {|int| !int_ary.include?(int)}
#   (first..last).to_a - int_ary
# end

def missing(int_ary)
  result = []

  int_ary.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end

  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []