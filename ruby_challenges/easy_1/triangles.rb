=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, 
and the sum of the lengths of any two sides must be greater than the length of the third side.

Requirements/Rules:

- input: length of three sides of a triangle, integers
- output: string, equilateral/isosceles/scalene

- if the three lengths provided are equal then it is an equilateral triangle
- if two sides have the same length, third is different, it is an isosceles triangle
- if the three sides are different, it is a scalene triangle
- Rules for Triangles: 
  - all sides must be of length > 0
  - sum of length of two sides > length of third side

Examples/Testcases:


Data Structures:
classes:
Triangle

Collaborators:
Triangle: array of three integers

Responsibilities:
Triangle: 
- is_a_triangle?
  - returns true if
    - all sides must be of length > 0
      - question: does the sum of all combinations of two sides need to be greater the third side
        - yes
        - no
    - sum of length of two sides > length of third side
- equilateral?
  - returns true if
    -  if the three lengths provided are equal then it is an equilateral triangle
- isosceles?
    - returns true if
      - if two sides have the same length, third is different, it is an isosceles triangle
- scalene?
    - returns true if
      - if the three sides are different, it is a scalene triangle
- type
    - returns a string
        - equilateral/isosceles/scalene

Algorithm:
- is_a_triangle?
High level:
        - if all sides > 0 and if sum of two sides is greater than third side(all combinations)
            - return true
Details:
- check if all sides are > 0
- [1,2,3] -> [[1,2], 3], [[1, 3], 2], [[2, 3], 1]


- equilateral?
        - if all lengths are the same
            - return true
- isosceles?
        - if any two sides are the same and the third is different
          - return true
- scalene?
        - if all lengths are different
          - return true

=end
