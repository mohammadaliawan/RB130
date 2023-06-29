# Optional Blocks

# def compute(arg)
#   if block_given?
#     yield(arg)
#   else
#     "Does not compute."
#   end
# end

# p compute(3) { |num| 5 + num } == 8
# p compute("xyz") { |str| 'a' + str } == 'axyz'
# p compute(4) == 'Does not compute.' 

def some_method(&block)
  if block_given?
    block.call
  else
    "Else" 
  end
end

p some_method { "something else"}