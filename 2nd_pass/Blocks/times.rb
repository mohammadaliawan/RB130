def times(int)
  counter = 0

  while counter < int
    yield(counter)

    counter += 1
  end

  int
end

p times(4) { |num| puts num }

