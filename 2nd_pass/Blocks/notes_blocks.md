# Blocks

## Closures in Ruby

### What are closures? Why is it called a closure?

A closure is a general programming concept that allows us to save a chunk of code and execute it at a later time. 

Its called a closure because it is said to bind its surrounding artifacts, like variable names and methods, and build an enclosure around everything so that they can be referenced when the closure is later executed.Closures retain a memory of their surrounding scope and can use and even update variables in that scope.

A closure can be thought of as a method without an explicit name that can be passed around and executed at a later time.

Closures are so useful because they can be passed around into existing methods

### How are closures implemented in Ruby? Three ways?

- `Proc` object
- Lambdas
- Blocks

All these different types of closures can be passed around as a 'chunk of code' and can be executed later.

### What is meant by binding of a closure?

A closures' binding is the set of variable and method names i.e its surrounding artifacts, that it retains references to when its passed around.

A closure retains references to variables, constants and methods that were in scope at the time and location you created the closure. It binds some code with the in-scope items.

## Calling Methods With Blocks

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

### Why is it that sometimes the code in the block affects the return value, and sometimes not? How can we find out how a block affects a method's return value?

The answer lies in how the method is implemented. The code in the block is not the method implementation.
It has nothing to do with the method implementation. The entire block is passed to the method as an argument just like any other argument. It is upto the method implementation to decide what to do with the block, execute it or ignore it.

We need to study the method's documentation or play around with the method to find out how passing a block to the method effects the method's return value.

## Writing Methods that take Blocks

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

### Why does the below code not raise an error?

```ruby
def echo_with_yield(str)
  yield if block_given?
  str
end

echo_with_yield("Hello")
```

It doen't raise a `LocalJumpError` because the method definition of `echo_with_yield` uses the `Kernel#block_given?` method in an `if` conditional. The `block_given?` method return `true` only is a block is passed to a method upon invocation, otherwise it returns `false`. On line XX, as we didnt pass a block to the `echo_with_yield` method invocation, `block_given?` on line xx returns `false` and the `yield` keyword on line xx is not executed. Execution goes to line xx and the method returns string object referenced by `str`.

### What is the sequence of code execution in the below code? Explain with line numbers. Also, differentiate between what consitutes the method implementation and what constitutes the method invocation.

```ruby
def say(words)
  yield if block_given?
  puts "> " + words
end

say("hi there") do
  system 'clear'
end
```

Execution starts at line 119 with the `say` method being called and the string object `"hi there"` being passed to it as an argument. In addition, the `do..end` block on line 119 to 121 is also passed to it as an argument.

Execution then goes to line 114 in the `say` method definition, with the `words` local variable assigned to the string object `"hi there"` and the block passed in implicitly without being assigned to a variable.

Execution then goes to line 115, where the `block_given?` method returns `true` as a block is passed to the `say` method invocation. Since the `if` conditional is true, the `yield` keyword is executed. `yield` executes the `do..end` block that was passed to `say` upon method invocation.

Execution then goes to line 119, where the `do..end` block is defined. Execution goes into the block on line 120 and executes the `system 'clear'` method invocation which clears the screen in the console.

Execution then goes to line 121, where the `do..end` block definition ends.

Execution then goes back to line 115, and then goes to line 116.

On line 116, the `puts` method is called and `> hi there` is output on the console. Execution then goes back to line 119 and the program ends.

### What is `num` in the below code, both in the context of the `|num|` and within the `do..end` block?

```ruby
3.times do |num|
  puts num
end
```
The `num` variable within the `||` is the block parameter and within the block it is called the block local variable. The block local variable is scoped at the block level and is not accessible outside the block.

### Trace the execution flow in the below code?

```ruby
def increment(num)
  if block_given?
    yield(num + 1)
  end
  num + 1
end

increment(3) do |value|
  puts "Hello! incremented value is #{value}"
end
```

Execution starts at line xx where the `increment` method is invoked and the integer `3` and the `do...end` block are passed in as arguments. 

Execution then goes to line xx where the `increment` method is defined. The method local variable `num` is assigned to the integer object `3` that was passed in as argument.

Execution then goes to the next line in the method, where the `if` conditional is evaluated. The `block_given?` method returns `true` because a block was implicitly passed to the `increment` method upon invocation on line xx. Execution goes to line xx where the `yield` keyword is executed. `yield` executes the passed in block and passes to the block the return value of `num + 1` which is `4`.

Execution then goes to the where the `do..end` block is defined i.e. line xx. The block local variable `value` is assigned to the integer object that was passed to the block i.e. `4`. Execution then goes to line xx where the `puts` method is invoked and the string `"Hello! incremented value is 4"`is output to the console.

Execution then goes to line xx where the block definition ends. 

Execution then goes back to line xx return `nil` to line xx. After which the `if` conditional ends.

Execution then goes to line xx where `num + 1` is evaluated and `4` is returned. Since this is the last line in the method, `4` is returned by the `icrement` method invocation to line xx from where it was called.


### What is meant by arity? WHat kind of arity do blocks, procs, methods and lambda's have?

The rule regarding the number of arguments you must pass to a block, proc, lambda or method is called its arity.

In Ruby, blocks and `proc`s have **lenient** arity which is why blocks don't raise an error if you dont pass enough or pass more arguments than what are expected.

Methods and Lambda's have a strict arity. Methods and Lambda's must be passed the exact number of arguments as are expected.

### What is the return value from the block in the below code? How does it affect the return value of the method?

```ruby
def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

compare('hello') { |word| word.upcase }
```

The return value of blocks is determined based on the last expression within the block. The block returns whatever the last expression returns. In the above code, the block consists of a single line of code `word.upcase`. Since, the block local variable `word` is assigned to the string object `"hello"`, `word.upcase` returns `"HELLO"` and this string object is returned by the block as well. This returned object is then assigned to the method local variable `after`. 

The return value of the `compare` method is not affected by the return value of the block in this case. Thats because, the return value of the method is determined by the last expression evaluated in the method which in this case is the `puts..` expression. Since `puts` always returns `nil`, the `compare` method always returns `nil`.

### Given the below code. Explain why the output shows nothing after `After:`.

```ruby
def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

compare('hello') { |word| puts "hi" }

# Before: hello
# hi
# After:
```
On line 193, the output relies upon the object assigned to the local variable `after`. `after` is assigned to the return value of the block on line 192. When the `compare` method yields to the block passed in `{ |word| puts "hi"}`, `puts` outputs `hi` and then returns `nil` which is then assigned to `after` on line 192. Hence, on line 193, `nil` is interpolated into the string `After: ..`. Since `nil.to_s` returns an empty string, there is nothing after `After:`

### What are the different scenarios in which we can use blocks?

1. When the method implementor wants to defer some method implementation code and allow the method user to decide at method invocation time how a particlular part of the method implementation should work.

Passing in blocks to methods allows us as method users to refine the method implementation at method invocation time without modifying the method implementation for everyone else who uses the method.

2. Methods that need to perform some before and after actions - Sandwich code

When a method needs to time how long it takes to do something

```ruby
def time_it
  puts "Before: #{before = Time.now}"
  yield
  puts "After: #{after = Time.now}"

  puts "It took #{after - before} seconds"
end

time_it do
  sleep(3)
  puts "Hello World!"
end
```

### What is an explicit block? How do you define a method to take an explicit block?

An explicit block is a block that gets treated as a named object. It gets assigned to a method parameter and gets managed like any other object, it can be passed to other methods, invoked many times, reassigned.

We can define a method to take an explicit block by defining a method parameter that starts with an `&`. The `&block` converts the block argument to a simple `proc` object. 

```ruby
def test(&block)
  block.call
end
```

###  Why do we now need an explicit block?

An explicit block is assigned to a variable, which allows us to pass this block or `proc` object to other methods as an argument. It also allows us to execute the block as many times as we need to and also in other methods that it is passed to.

### How can we pass arguments to an explicit block?

```ruby
def test(&block)
  block.call("hello")
end

test { |prefix| puts prefix + "xyz"}
```

### What abilities of blocks make them so useful in Ruby?

Blocks retain references to the variable names in their surrounding even when they are passed into other methods. So even in scopes where the said variables or methods are out of scope, the block can still reference them as it retains references to these variables.

For Example:

```ruby
def for_each_in(arr)
  arr.each { |ele| yield ele }
end

array = [1,2,3,4,5]
results = [0]

for_each_in(array) do |element|
  total = results[-1] + element
  results.push(total)
end

p results
```

We can also return `proc`s and lambda's from blocks and methods. Each `proc` objects returned from each of the method calls of the same method will have its own independent and seperate copies of the variables in its binding. 

### Summary

 - blocks are one way that Ruby implements closures. Closures are a way to pass around an unnamed "chunk of code" to be executed later.

 - blocks can take arguments, just like normal methods. But unlike normal methods, it won't complain about the wrong number of arguments being passed to it.

 - blocks return a value, just like normal methods.

 - blocks are a way to defer some implementation decisions to method invocation time. It allows method users to refine a method at invocation time for a specific use case. It allows method implementors to build generic methods that can be used in a variety of ways.

 - blocks are a good use case for "sandwich code" scenarios, like closing a File automatically.

 - methods and blocks can return a chunk of code by returning a Proc or lambda.

## Each, Times, Select, Reduce

```ruby
def times(int)
  counter = 0

  while counter < int
    yield(counter)

    counter += 1
  end

  int
end
```

```ruby
def each(ary)
  index = 0

  while index < ary.size
    yield(ary[index])

    index += 1
  end

  ary
end
```
Writing a generic iterating method allows method callers to add additional implementation details at method invocation time by passing in a block. 

## TodoList Each

### Why is it important not to access the internal state of TodoList objects and to use the public interface of the object?

It is important because doing so could result in unwanted manipulation of TodoList objects. For example, using the `add` method we are enforcing the rule of "Only add `Todo` objects to the list". But by directly access the `@todos` array we are bypassing this rule. This is the idea behind **encapsulation**; we want to hide the implementation details from the users of the class, and not encourage users of the class to access the internal state.

The entire goal of creating a class and encapsulating logic in a class is to hide implementation details and contain ripple effects when things change. Prefer to use the class's interface where possible.

## Blocks and Variable Scope

### Closures and Binding

A block is how Ruby implements the idea of a closure. A closure is a general programming concept of a "chunk of code" that you can pass around and execute at some later time. 

In order for this chunk of code to be executed later, it must understand the surrounding context from where it was defined. 

Closures keep track of its surrounding context, and drags it around wherever the chunk of code is passed to. In Ruby, we call this its binding or surrounding context/=environment. A closure must keep track of its binding to have all the information it needs to be executed later. This includes local variables, method references, constants and other artifacts in your code.

Note: Any variables that need to be accessed by the closure must be defined _before_ the closure is created, unless the variable is explicitly passed to the closure when it is called.

## Quiz

### Closures and Binding

A closure lets you save a chunk of code and execute it later. You can pass closures around like objects.

Closures are created by passing a block to a method, creating a `Proc` Object, or creating a lambda.

### What do we mean when we say that a closure creates a binding?

A closure retains access to variables, constants, and methods that were in scope at the time and location you created the closure. It binds some code with the in-scope items.

A closure retains access to variables within its binding rather thatn the specific values of those variables at the time the closure was created; if the values of those variables changes, the closure access the new values.

### Which of the following actions creates a closure in Ruby?

- Passing a block to a method
- Creating a `Proc` object
- Creating a lamda

### Which of the following situations is a good use case for writing a method that takes a block?

- To let methods perform some kind of before and after actions
- To defer some implementation code until method invocation

### Can all Ruby methods take a block as an argument?

Yes all Ruby methods can take an optional block as an implicit argument.

### Write the method definition?

```ruby
def welcome(str)
  puts str + ' ' + "#{block_given? ? yield : ''}"
end

welcome('Hello') { 'there' } # => Hello there
welcome('Hey') { 'Joe' }   # => Hey Joe
welcome('Hi!')                # => Hi! (there's a space after the !)
```
### What kind of arity do blocks have in Ruby?

Blocks have a linient arity in Ruby which means that:
- You can pass more arguments than the block parameter list shows
- You can pass fewer arguments than the block parameter list shows. When mising block parameters are accessed in the block they will be `nil`.

In other words, you can pass either fewer or more arguments than the block parameter list shows; the block ignores extra arguments and uses a `nil` value for omitted arguments.

### What does `&block` do?

- It lets us _explicitly_ pass in the block to the method
- It converts the block to a `Proc` object and assigns it to a local variable.

### Why does the below code raise an error?

```ruby
def call_chunk(code_chunk)
  code_chunk.call
end

say_color = Proc.new {puts "The color is #{color}"}
color = "blue"
call_chunk(say_color)
```
The above code raises a `NameError` when the `Proc` object referenced by `code_chunk` is called because the `color` local variable is not part of the binding of this closure. 

The local variable `color` is not part of the `Proc` object's binding since it isnt in scope when the `Proc` is created. 

### How does Ruby evaluate the following code?

```ruby
"the cat in the hat".split.map(&:capitalize).join(' ') # => "The Cat In The Hat"
```

Ruby uses the `Symbol#to_proc` method to convert the symbol `:capitalize` to a `Proc` object and then converts this `Proc` object to a block.

So the above code could also be written as:

```ruby
"the cat in the hat".split.map(&:capitalize.to_proc).join(' ')
```

### Which of the following names is part of the binding for the block body on line 12?

```ruby
ARRAY = [1, 2, 3]

def abc
  a = 3
end

def xyz(collection)
  collection.map { |x| yield x }
end

xyz(ARRAY) do
  # block body
end
```

Awnser: The constant `ARRAY`, the methods `abc` and `xyz`.