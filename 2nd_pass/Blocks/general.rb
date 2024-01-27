def test(&block)
  puts "1"
  test2(block)
  puts "2"
end

def test2(block)
  puts "3"
  block.call
  puts "4"
end

test{}

# We are invoking the test method on line 13 and passing in a block as
# an explicit argument. This block gets converted to a simple `proc` object
# by the `&block` method parameter and is now referenced by the local variable
# `block`. On line 3 the test2 method is invoked and the simple `proc` object referenced 
# by `block` is passed in as an argument. 

