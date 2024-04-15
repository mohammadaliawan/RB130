def compute(arg)
  if block_given?
    yield(arg)
  else
    "Does not compute."
  end
end

p compute(10) { |num| 5 + 3 + num} == 18
p compute { 'a' + 'b' } == 'ab'
p compute(10) == 'Does not compute.'