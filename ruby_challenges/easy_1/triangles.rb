=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, 
and the sum of the lengths of any two sides must be greater than the length of the third side.

Requirements/Rules:
- equilateral - all three sides are same length
- isoceles- exactly two sides of same length
- scalene - all three sides of different length
- To be a valid triangle:
  - all sides must be greater than 0
  - sum of lengths of any two sides must be greater than langth of the third side

Examples/Testcases:
Tests indicate that we need to a Triangle class.

Instance methods required:
- constructor method that takes 3 arguments
  - need to store the sides as the Triangle object's state
  - raises ArgumentError if any of the sides is 0
  - raises ArgumentError if any of the sides is -tive
  - raises ArgumentError if sum of any two sides is less than or equal to the third side

= kind: takes no arguments, returns a string
  - 'equilateral' -> when all sides are equal
  - 'isosceles' -> when two sides are equal
                  - last two sides
                  - first last sides
                  - first two sides
                  - exactly two sides, third side is not equal
  - 'scalene' -> when no equal sides given in ascending order
              -> when no equal sides given in descending order
  - returns appropraite string even if sides are less than 1

Datastructure:
- sides stored as numbers - integers or floats
- the numbers are stored in an array for easy reference

- Algorithm:

Constructor:

input: three numbers integers or floats

- take three numbers as arguments
- store the sides as part of the state of the object
- if any side is less than or equal to 0
    - raise ArgumentError
- if sum of any two sides is less than or equal to third side
    - raise ArgumentError


=end

class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3

    @sides = [@side1, @side2, @side3]

    raise ArgumentError if any_side_zero?
    raise ArgumentError if size_inequality?
  end

  def kind
    if equilateral?
      'equilateral'
    elsif isosceles?
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def any_side_zero?
    @sides.include?(0)
  end

  def size_inequality?
    @sides[0..1].sum <= @sides[2] ||
    @sides[1..2].sum <= @sides[0] ||
    @sides[0] + @sides[2] <= @sides[1]
  end

  def equilateral?
    @sides.uniq.size == 1
  end

  def isosceles?
    @sides.uniq.size == 2
  end

  def scalene?
    @sides.uniq.size == 3
  end
end

tri = Triangle.new(2,5,4)
