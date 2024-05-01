=begin
Write a program to determine whether a triangle is equilateral,
 isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0,
 and the sum of the lengths of any two sides 
must be greater than the length of the third side.

- Explicit Rules/Requirement

  - write a program that determines if a triangel is equilater,
  isosceles or scalene
  - triangles have three sides
  - equilateral: all three sides are same length
  - isosceles: exactly two sides of the same length
  - scalene: all three sides are of different lengths
  - For a shape to be a valid triangle,
    - all sides must be greater than 0
    - sum of any two sides > length of third side

- Implicit Requirements:

  - Triangle class required

- Methods required:

DS: Triangle sides as a list/array
    

=end

class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new("Invalid trianlge sides") unless valid_sides? && valid_triangle?
  end

  def kind
    #kind
      # - returns the string 'equilateral' if all sides are equal
      # - for both small sides and larger sides
      # - returns the string 'isosceles' if any two sides are equal
      #   - last two sides equal
      #   - first last sides equal
      #   - first two sides equal
      #   - exactly two sides equal
      # - returns the string 'scalene' if no equal sides
      #   - small sides
      #   - large sides
      #   - sides in descending order

    if @sides.uniq.size == 1
      "equilateral"
    elsif @sides.uniq.size == 2
      "isosceles"
    else
      "scalene"
    end
  end

  private

  def valid_sides?
    @sides.all? { |side| side > 0}
  end

  def valid_triangle?
    (@sides[0..1].sum > @sides[2]) &&
    (@sides[1..2].sum > @sides[0]) &&
    ((@sides[0] + @sides[2]) > @sides[1])
  end
end