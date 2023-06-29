def each(ary)
  index = 0

  while index < ary.size
    yield ary[index]

    index += 1
  end

  ary
end

ary = [1,2,3]
sum = 0

x = each(ary) do |ele|
  sum += ele
end

p sum, x