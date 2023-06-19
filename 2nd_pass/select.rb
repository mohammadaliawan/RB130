def select(ary)
  index = 0
  result = []

  # while index < ary.size
  #   if yield(ary[index])
  #     result.push(ary[index])
  #   end

  #   index += 1
  # end

  ary.each do |ele|
    if yield(ele)
      result.push(ele)
    end
  end

  result
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true