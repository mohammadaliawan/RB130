def map(ary)
  ary.each_with_object([]) do |element, result|
    p element
    result << yield(element)
  end
end

# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# p map({a: 1, b: 2}) { |key, value| value*2}

[[:a, 1], [:b, 2]].each do |value|
  p "#{value}"
end