=begin
Write a method that takes a positive integer, n, as an argument, and 
displays a right triangle whose sides each have n stars. 
The hypotenuse of the triangle (the diagonal side in the images below) should have one end 
at the lower-left of the triangle, and the other end at the upper-right.


Requirements:

- A method that takes a positive integer as argument
- displays a right triangle
- each side has n stars
- Hypotenuse- one end at the lower left, other at upper right- right justified strings
- one star at the top, n stars at the bottom
- output can be printed in the form of n strings - meaning that perpendular has n stars
- last string has n stars - base has n stars
- first string will have one star and n-1 empty spaces
- nth string will have n stars and 0 empty spaces
- 

Examples:

triangle(5) == "    *\n   **"
triangle(9)
triangle(1) raises CustomError, N msut be greater than 1
triangle(-1) raises CustomError, N msut be greater than 1
triangle(0) raises CustomError, N msut be greater than 1

Algorithm:
- given a positive integer
- print n strings each having size n
- first string to have n-1 spaces and 1 star
- each consectutive string to have n-x spaces and x stars
  - x ranges from 1 to n
- last string to have n stars and 0 spaces

Implementation details:
- create an empty array to store strings
- loop from 1 to n
  - on each iteration create a new empty strings
    - append " "*(n-x) to same string
    - append "*"*x to same string
  - atore the string in the result array
- output all strings in the array on seperate lines.
=end

def triangle(n)
  result = []

  1.upto(n) do |x|
    str = ""
    str << (" "*(n-x))
    str << ("*"*x)
    result << str
  end

  puts result
end


triangle(5)

#     *
#    **
#   ***
#  ****
# *****

triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********