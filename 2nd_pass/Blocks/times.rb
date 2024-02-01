
def times(int)
  counter = 0

  while counter < int
    yield counter
    counter += 1
  end

  int
end

p times(5) {|num| puts num}

# execution starts at line 13 when the times method is called with an argument `5` and 
# a block as an implicit argument.

# Execution then enters the method implementation at line 2 where the method local variable
# `int` is assigned to the passed in argument `5`. 

# Execution then goes to the next line where the local variable `counter` is
# initialized and assigned to `0`.

# execution then goes to line x, where the while loop conditional is evaluated
# The first time through the loop the conditional will be true so execution 
#  goes to the next line where `yield` invokes the block and passes in the 
#  object referenced by `counter` to the block.

 # Execution jumps to line x where the block is defined and assigns the object referenced by `counter` to
 # the block local variable `num`. Execution then goes to the next line within the block which output the object 
 # referenced by `num`.
 
 # execution goes back to the times method implementation on line x where the counter variable is incremented by 1.
 # Reaching the end of the while loop, execution goes back to line 4, repeating steps above until the while conditional returns false at which point the while loop
 # ends and the execution goes to the last line in the method implementation.