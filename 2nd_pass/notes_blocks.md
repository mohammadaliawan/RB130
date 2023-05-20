# Blocks

## Closures in Ruby

### What are closures? Why is it called a closure?

A closure is a general programming concept that allows us to save a chunk of code and execute it at a later time. 

Its called a closure because it is said to bind its surrounding artifacts, like variable names and methods, and build an enclosure around everything so that they can be referenced when the closure is later executed.

A closure can be thought of as a method without an explicit name that can be passed around and executed at a later time.

Closures are so useful because they can be passed around into existing methods

### How are closures implemented in Ruby? Three ways?

- `Proc` object
- Lambdas
- Blocks

All these different types of closures can be passed around as a 'chunk of code' and can be executed later.

### What is meant by binding of a closure?

A closures binding is set of variable and method names i.e its surrounding artifacts, that it retains references to when its passed around.

### What are the three main components in the below code?

```ruby
[1,2,3].each do |ele|
  puts ele
end
```

- Object: Array object `[1, 2, 3]`
- Method: `Array#each`
- Block:

```ruby
            do |ele|
  puts ele
end
```

### What is the relationship of a block to the method invocation?

The block is an argument being passed to the method invocation.

In the above example the `do..end` is actually being passed to to the `Array#each` method.

### Why is it that sometimes the code in the block affects the return value, and sometimes not?

The answer lies in how the method is implemented. The code in the block is not the method implementation.
It has nothing to do with the method implementation. The entire block is passed to the method as an argument just like any other argument. It is upto the method implementation to decide what to do with the block, execute it or ignore it.


### Why does the below code not raise an error?

```ruby
def hello
  "Hello!"
end

p hello {puts "hi"}
```

The above code does not raise an error because in Ruby every method can take an optional block as an implicit argument.

### What keyword is used to call a block passed to a method?

`yield`

### Why does the below code raise an argument error? Is it because of the block being passed to the method invocation?

```ruby
def echo_with_yield(str)
  yield
  str
end

p echo_with_yield("Hello", "World") { puts "Goodbye"} # wrong number of arguments (given 2, expected 1) (ArgumentError)
```

The above code raises an `ArgumentError` because the expected number of arguments as per the method definition of `echo_with yield` is 1 (defined by the `str` method parameter), but we are passing in two string arguments `"Hello"` and `"World"` on mehtod invocaition on line XX. As all methods take an optional block as an implicit argument, passing in the block does not raise this error. The number of arguments passed at method invocation should match the method definition, regardless of whether we are passing in a block or not.

### When is the `LocalJumpError` raised?

When a method is invoked that contains the `yield` keyword for yielding to the block but no block is passed upon method invocation.

### How can we define a method that does not raise an error whether a block is passed to it or not?

We can use the `Kernel#block_given?` method in an `if` conditional. `block_given?` method returns `true` only if a block is passed to the method upon invocation. 