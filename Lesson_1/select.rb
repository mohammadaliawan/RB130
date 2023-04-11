def select(ary)
  counter = 0
  new_ary = []

  while counter < ary.size
    if yield(ary[counter])
      new_ary << ary[counter]
    end

    counter += 1
  end

  new_ary
end

array = [1, 2, 3, 4, 5]

new_ary = select(array) do |num|
  nil
end

p new_ary