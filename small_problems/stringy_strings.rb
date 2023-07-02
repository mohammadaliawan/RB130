=begin
Write a method that takes one argument, a positive integer, 
and returns a string of alternating 1s and 0s, always 
starting with 1.The length of the string should match 
the given integer.


Requirements:
- given a positive integer n
- return a string of alternating 1s and 0s
- string should always start with 1
- length of string should be n
- length of string should be greater than or equal to 1

"101" -> 
start with 1
next index or size of string even then 1
next index or size of string odd then 0
"1010"

index goes from 0 to n-1
size of string goes from 1 to n

Algo:

- given a positive integer n
- create a new string ""
- iterate from size of new string  to n-1
  - if size of current string is even
    - append "1"
  - otherwise
    - append "0"
- return the new string
=end

def stringy(n)
  string = ""
  next_char_index = string.size

  while next_char_index <= (n - 1)
    string << "1" if next_char_index.even?
    string << "0" if next_char_index.odd?
    next_char_index = string.size
  end

  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'