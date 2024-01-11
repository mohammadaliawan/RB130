def for_each_in(arr)
  arr.each do |number|
    yield number
  end
end

arr = [1,2,3,4]
results = [0]

for_each_in(arr) do |number|
  total = results[-1] + number
  results << total
end

p results