# Blocks

## Closures in Ruby

### WHat are closures? Why is it called a closure?

A closure is a general programming concept that allows us to save a chunk of code and execute it at a later time. 

Its called a closure because it is said to bind its surrounding artifacts, like variable names and methods, and build an enclosure around everything so that they can be referenced when the closure is later executed.

A closure can be thought of as a method without an explicit name that can be passed around and execute at a later time.

Closures are so useful because they can be passed around into existing methods

### How are closures implemented in Ruby? Three ways?

- `Proc` object
- Lambdas
- blocks

All these different types of closures can be passed around as a 'chunk of code' and can be executed later.

### What is meant by binding of a closure?

A closures binding is set of variable and method names i.e its surrounding artifacts, that it retains references to when its passed around.

### What are the three main components in the below code?

```ruby
[1,2,3].each do |ele|
  puts ele
end
```




