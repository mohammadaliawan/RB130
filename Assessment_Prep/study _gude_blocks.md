Closures, binding, and scope
How blocks work, and when we want to use them.
Blocks and variable scope
Write methods that use blocks and procs
Understand that methods and blocks can return chunks of code (closures)
Methods with an explicit block parameter
Arguments and return values with blocks
When can you pass a block to a method
&:symbol
Arity of blocks and methods


# Closures, binding, and scope

## What are closures?

- piece of code
- can be saved
- can be executed later
- retains references to names in its surrounding environment or context
- 

A closure is a piece or chunk of code that can be saved and passed around to existing methods and executed at a later time i.e. later than when it is defined. A closure retains references to variable and method names in its surrounding environment or context where it is defined. This allows the closure to reference these variables or methods later when it is executed.

A closure can also be thought of as an unnamed method that can be passed to other methods and executed at a later time.

## How does Ruby implement Closures?

Ruby implements closures in three ways:

- `Proc` objects
- Lambdas
- Blocks

All of these closure types can be passed into methods and executed at a later time.


## What is a closure's binding?

A closure keeps track of its binding.

A closures binding is the set of local variables, methods and constant names in its surrounding environment or context where it is defined and that it retains references to and carries it around with itself wherever it is passed to.

A closure keeps track of its binding, so that later when it is executed, it has all the information it needs to be executed correclty.

This execution could be in a scope where those names might be out of scope but it can still refer to them and even reassign them if required.

## How does a closures binding effect its scope?

As a closure retains references to names of local variables in its surrounding context where it is defined (not where it is invoked), it can refer to these variables or even reassign them even if the block is being executed in a scope where those variables would normally be out of scope. This allows a closure to access local variables not based on where it is called but based on where it was defined.

For example:

```ruby
def a_method
  yield
end
str = "Hello"

a_method { str = "Bye"}

puts str # Bye
```

In the above code, the block `{ str = "Bye"}` is being executed inside the method `a_method` when `yield` is invoked and `str` is not in scope inside this method. But when we see the output on line XX, we can see that `str` has been reassigned to `"Bye"`. This is because the block `{ str = "Bye"}`retains a reference to local variable `str` and carries this reference around with itself when it is passed into the method `a_method`. That is why the block can reference `str` and even reassign it when the block is executed inside `a_method`.

# How blocks work, and when we want to use them.

## What are blocks?

Blocks are a type of closure in Ruby and are created using either the `{...}` syntax or the `do..end` syntax. They are unnamed pieces of code that can be passed to method calls as arguments. The method implementation then decides what to do with this block. It can execute the block by yielding to it with the keyword `yield` or it can totally ignore the block.

## What is the relationship of a block to the method invocation?

The block is an argument being passed to the method invocation.

In the above example the `do..end` is actually being passed to to the `Array#each` method.

## Number of arguments to a method that takes a block

Regardless of whether we are passing in a block to a method as argument or not, the number of positional arguments at method invocation time (that dont have a default value) needs to match the number of parameters defined for that method in its method definition.

## Methods that can take blocks. Why is it that sometimes the code in the block affects the return value of the method invocation, and sometimes not? How can we find out how a block affects a method's return value?

In Ruby, all methods can take an optional block as an implicit argument. How this block effects the return value of the method depends on the method implementation details. The method can execute the block, use its return value or completely ignore the block. It is upto the method implementation. 

We need to study the method's documentation or play around with the method to find out how passing a block to the method effects the method's return value.

## Return value of blocks

Just like methods, they have a return value which is the evaluated result of the last line of code executed in the block.This return value is returned by the `yield` keyword.

## `LocalJumpError`

A `LocalJumpError` is raised when a method definition contains the `yield` keyword but no block is passed to it when the method is invoked.

We can avoid this error by using the `Kernel#block_given?` method in an `if` conditional. This method returns `true` when a block has been passed to a method upon invocation and `false` otherwise.

## Passing arguments to blocks

We can even pass arguments to blocks by passing them to `yield`. Within the block this argument is assigned to a block local variable that is defined as a block parameter when the block is defined. 

# Arity of blocks and methods

## What is arity?

# Blocks and variable scope
# Write methods that use blocks and procs
# Understand that methods and blocks can return chunks of code (closures)
# Methods with an explicit block parameter

We can define a method to take an explicit block as an argument. 

An explicit block is one that gets assigned to a method local variable (defined as a method parameter) as an object. This allows us to pass it to other methods, reassign it and invoked it as many times as needed.

We can define a method to take an explicit block, by defining it with a parameter that is prepended by the `&` character. The `&block` coverts a block argument to a simple `Proc` object.

AN explicit block provides us with a way to refer to the block (a handle). The variable that references this `Proc` object can be passed to other methods.

Ruby converts blocks passed in as explicit blocks to simple `Proc` objects.

# Arguments and return values with blocks
# When can you pass a block to a method
# &:symbol

## How does the the proc to block `&` operator work with arguments to methods?

When the `&` operator is applied to an argument object to a method, ruby trys to convert that object to a block. If this object is a `Proc` object this conversion happens automatically.

If, however, the argument object is not a proc, ruby trys to the call object's `to_proc` method first and convert it to a `Proc` object. If it is able to successfully convert the argument object to a proc then `&` converts that proc to a block.

`&:to_s` creates a proc that invokes the `to_s` method on a passed object.




