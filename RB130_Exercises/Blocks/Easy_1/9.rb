def one?(ary)
  counter = 0
  ary.each do |ele|
    if yield(ele)
      counter += 1
      return false if counter >= 2
    end
  end

  if counter == 0
    false
  else
    true
  end
end

def one?(ary)
  seen_one = false
  ary.each do |ele|
    next unless yield(ele)
    return false if seen_one
    seen_one = true
  end
  seen_one
end


p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false