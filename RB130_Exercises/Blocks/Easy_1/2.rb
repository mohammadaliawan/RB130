def compute(arg)
  return 'Does not compute.' unless block_given?
  yield(arg)
end

p compute(8) { |some_value| some_value + 10}
p compute("a") { |some_letter| some_letter + "v"}
p compute(10)

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# The Kernel#block_given? method is used here to detect if a block was passed to the method
# invocation. This method returns true if a block was passed and false otherwise.
