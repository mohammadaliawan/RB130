# How blocks work, and when we want to use them.

__How to create blocks
How to pass blocks to methods
How to invoke blocks
How to pass arguments to blocks
return value of blocks
when we want to use blocks__

## What are blocks?

Blocks are a type of closure in Ruby and are created using either the `{...}` syntax or the `do..end` syntax following a method invocation. They are unnamed pieces of code that can be passed to method calls as arguments. The method implementation then decides what to do with this block. It can execute the block by yielding to it with the keyword `yield` or it can totally ignore the block.

## What is the relationship of a block to the method invocation?

The block is an argument being passed to the method invocation.

```ruby
[1,2,3].each do |num|
  puts num
end
```

In the above example the `do..end` is actually being passed to to the `Array#each` method.

## Number of arguments to a method that takes a block

Regardless of whether we are passing in a block to a method as argument or not, the number of positional arguments at method invocation time (that dont have a default value) needs to match the number of parameters defined for that method in its method definition.

## Methods that can take blocks. Why is it that sometimes the code in the block affects the return value of the method invocation, and sometimes not? How can we find out how a block affects a method's return value?

In Ruby, all methods can take an optional block as an implicit argument. How this block effects the return value of the method depends on the method implementation details. The method can execute the block, use its return value or completely ignore the block. It is upto the method implementation. 

We need to study the method's documentation or use the method to find out how passing a block to the method effects the method's return value.

## Return value of blocks

Just like methods, they have a return value which is the evaluated result of the last line of code executed in the block.This return value is returned by the `yield` keyword.

For example:
```ruby
def output
  puts yield
end

output {"Hello World"} # Hello World
```
In the above example, we invoke the `output` method on line x and pass in a block `{"Hello World"}`. The `output` method invokes the block that was passed in using the keyword `yield` on line . The block `{"Hello World"}` only contains one expression so that is the last expression evaluated in the block and the return value of this expression is returned by the block which is simply the string `"Hello World"`. This string is the output by `puts`. So we can see that `yield` returns whatever the block returns. And blocks return the evaluated result of the last expression evaluated within that block, similar to methods.

## `LocalJumpError`

A `LocalJumpError` is raised when a method definition contains the `yield` keyword but no block is passed to it when the method is invoked.

We can avoid this error by using the `Kernel#block_given?` method in an `if` conditional. This method returns `true` when a block has been passed to a method upon invocation and `false` otherwise.

## Passing arguments to blocks

We can pass arguments to blocks by passing them to `yield`. Within the block this argument is assigned to a block local variable that is defined as a block parameter when the block is defined. 

For example:

```ruby
def output(value)
  puts yield(value)
end

output(55) { |int| int + 5 } # 60
```
In the above example, we invoke the `output` method on line x and pass in `55` as an argument and a block `{ |int| int + 5 }`. The block defines a block parameter `int`. The `output` method invokes the block that was passed in using the keyword `yield` on line x and we pass the object referenced by `value` as argument to `yield` i.e. `55`. This argument to the block is assigned to the block local variable `int`. The block increments the passed in integer by `5`. Since this is the last expression in the block, the evaluated result of `int + 5` i.e. `60` is returned by the block and output by `puts` on line x. This is how arguments are passed to blocks.

## Arity of blocks and methods

### What is arity?

The rule regarding required number of arguments that need to be passed to a method, block, proc or lamda is known as its arity. 

### Blocks and Procs arity

In Ruby, blocks and `Proc` objects have a lenient arity which means that they dont raise an error if they are invoked with less or more arguments than are expected i.e. defined as block or Proc parameters. 

If more arguments are passed to the block or `Proc` object than are defined by the number of block or `Proc` parameters, then the extra arguments are ignored.

If less arguments are passed to the block or `Proc` object than are defined by the number of block or `Proc` object parameters, the extra block/ Proc local variables are assigned to nil.

### Methods and Lamdas arity

Methods and Lambda's have a strict arity. Methods and Lambda's must be passed the exact number of arguments as defined by the method/lamda parameters. 

If less or more arguments are passed to a method or lamda, Ruby raises an `ArgumentError`.

## When do we want to use blocks in our code?

There are two major use cases for blocks:

1. Create a generic method whose implementation can be refined at method invocation time for a specific use case without modifying the method's implementation for everyone else who uses the method. This implementation detail is passed in to the method invocation as a block. This allows the creator of the method to defer some implementation details of the method to method invocation time.

```ruby
def display_greeting(str)
  puts yield(str)
end

display_greeting("hello") { |str| "**!!#{str.upcase}!!**"}
```
In the above example, we invoke the `display_greeting` method and pass in a string `"hello"`as an argument. We also pass in a block `{ |str| "**!!#{str.upcase}!!**"}` specifying the implentation details about how the greeting should be displayed. 
The `display_greeting` method invokes the block that is passed in with the keyword `yield` and passes in the string to the block that was passed in to the `display_greeting` method and assigned to `str`. When the block is done formatting the string that was passed in (i.e. block execution is complete) and returns the formatted string, it is passed to `puts` which outputs it to the console.

The `display_greeting` is defined in a such a way that anyone can use this method to display a greeting in whatever formatting they wish by passing in those details as a block. `display_greeting`'s responsibility starts and finishs with just outputting what is returned by the block.

**The second use case:**

Methods that need to perform some before and after action. 

Another usecase for blocks is when we need to sandwich some code between some before and after actions. So the method's sole responsibility is to perform these before and after actions. The code that is sandwiched between these before and after actions could be anything. This 'anything' is passed into the method as a block. 

So again, similar to the above use case, the method is generic in its implementation and it is refined by passing in a block.

A very simple example of this is given below:

```ruby
def notify
  puts "Starting testing at #{Time.now}"

  yield

  puts "Testing Completed at #{Time.now}"
end

notify do
  # run some tests
end

```

In the above example, we have defined a `notify` method. We invoke this method on line x and pass it a block that contains some tests. On line x the `notify` method is defined to display a message when the testing starts with the time and then invokes the block using the keyword `yield` on line x. Once the block execution is complete i.e. the tests are completed, execution is returned to the `notify` method which again displays a message and the time. 

So the notify method is defined in a generic way to display notifications when the block execution starts and when it ends. These are the before and after actions. The block that is passed in defines the 'anything'. The `notify` method does not care about that. Its sole responsbility is to display the notifications before and after invoking the block.