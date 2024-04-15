def zip(ary_1, ary_2)
  ary_1.map.with_index do |ary_1_value, index|
    [ary_1_value, ary_2[index]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) #== [[1, 4], [2, 5], [3, 6]]