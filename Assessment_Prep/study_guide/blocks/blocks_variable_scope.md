# Blocks and variable scope

A method invocation block creates a new scope for local variables known as the inner scope. Local variables initialized in an outer scope (outside the block) are accessible in an inner scope (inside the block) while local variables initialized in an inner scope are not accessible in the outer scope.

The reason why inner scope can access local variables in an outer scope is because of what is known as the binding of closures (in this case a block). A closure's binding is the set of local variables, methods and constant names in its surrounding environment or context where it is defined and that it retains references to and carries it around with itself wherever it is passed to. 

Hence, all the local variables that are initialized before the block is created, are accessible to the block. It doesnt matter where the block is passed to and where it is being executed. If the local variable was initialized in the surrounding context of the block before the block was defined, it will be accessible to the block. Because it is part of the block's binding.

But one thing to note here is that, the said local variables must be in an outer scope with respect to the block. Local variables inside peer blocks are not part of the block's binding.

For example:

```ruby
def a_method
  yield
end
str = "Hello"

a_method { str = "Bye"}

puts str # Bye
```

In the above code, the block `{ str = "Bye"}` is passed to the `a_method` method invocation on line x. This is the line where the block is being defined. But it is being executed inside the method `a_method` when `yield` is invoked and `str` is not in scope inside this method. But when we see the output on line XX, we can see that `str` has been reassigned to `"Bye"`. This is because the block `{ str = "Bye"}`retains a reference to local variable `str` (it is part of the block's binding) and carries this reference around with itself when it is passed into the method `a_method`. That is why the block can reference `str` and even reassign it when the block is executed inside `a_method`.