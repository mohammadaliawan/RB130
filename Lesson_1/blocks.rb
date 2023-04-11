# [1, 2, 3].each do |num|
#   puts num
# end

# Object: Array Object [1, 2, 3]
# Method: Array#each
# Block: do...end

# Block is an argument to the each method call 
# [1, 2, 3].each { |num| puts num} is actually passing in the block to the each mehtod
# blocks are just another argument being passed in at method invocation.

# The block passed to a method has nothing to do with the method implementation.
# It is upto the method implementation to decide what to do with the block of code passed into it.

# def hello
#   "hello!"
# end

# p hello { puts "hi" }

# In Ruby every method can take an optional block as an implicit argument

def echo_with_yield(str)
  yield if block_given?
  str
end

p echo_with_yield("Hello")
