# Blocks

## What is a closure? Why is it called a closure?

A closure is a general term that is used in programming languages to represent a "chunk" or "piece" of code that can be saved, passed around and executed at a later time.

The reason it is called a closure is because it binds its surrounding artifacts e.g names of variables and methods and it can then reference these vairables and methods later when it is executed.

In other words, its a method without an explicit name that you can pass around and execute later.

## How does Ruby implement closures?

Ruby implements closures through `Proc` objects, lamdas or blocks.All these items can be saved, passed around and executed later.

## What is meant by "binding" of a closure?

A closures' binding is the set of variable and method names in its surrounding that it retains references to.

## What is the relationship between the `each` method invocation and the `do..end` block below?

```ruby
[1,2,3].each do |x|
  puts x
end
```
The `do..end` block is an argument to the `[1,2,3].each` method invocation. The `do..end` block is being passed in to the `each` method. 

## Why is that sometimes the code in the block affects the return value and sometimes not?

The block is passed into to method as an argument. And just like any other argument to a method, the method implementation decides what to do with this block of code. It could completely ignore it or execute it in a way that affects the return value of the method.So, whether the block of code affects the return value of the method or not, depends entirely on how the method is implemented. We need to study the method documentation or use the method to understand how passing in the block affects its behaviour.

**Blocks are just another argument being passed in to a method at method invocation time.**


