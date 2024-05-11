For the topics shown below, you should be able to provide clear explanations, using code snippets as examples, and be able to identify these concepts within code snippets.

Closures, binding, and scope
How blocks work, and when we want to use them.
Blocks and variable scope
Arity of blocks and methods

Create custom methods that use blocks and procs**
Understand that methods and blocks can return chunks of code (closures)**
Methods with an explicit block parameter**
Arguments and return values with blocks**
When can you pass a block to a method**
&:symbol**



# Closures, binding, and scope

## What are closures?

- piece of code
- can be passed around
- can be executed later
- retains references to its surrounding artifacts (e.g variables, methods, constants) known as its binding.

A closure is a general term that is used in programming languages to describe a "chunk" or "piece" of code that can be passed around and executed at a later time. These "chunks of code" are able to keep track of artifacts in their surrounding context e.g variable names, methods and constant, any thing it needs to be executed later. This surrounding environment or context of the closure is known as its binding.

A closure retains references to variable and method names in its surrounding environment or context where it is defined. This allows the closure to reference these variables or methods later when it is executed.

In other words, its a method without an explicit name that you can pass around and execute later.

Examples of closures:

```ruby
[1,2,3].each do |num|
  puts num
end

[1,2,3].each { |num| puts num}
```

In the above example, the `do..end` chunk of code from line x to x and `{ |num| puts num}` on line x are blocks. These blocks are being passed to the `each` method invocation as arguments.

```ruby
def some_method(a_proc)
  some_num = 5
  a_proc.call(some_num)
end

add_one = Proc.new { |num| num + 1}

p some_method(add_one)
```
In the above example, on line x we are instantiating a new `Proc` object by invoking the `Proc::new` method and passing in a block as argument. `add_one` local variable is assigned to the returned `Proc` object. 

Now this `Proc` object can be passed to any method as any other argument would be passed. So, on line x we are invoking the `some_method` and passing in the `Proc` object referenced by `add_one` to the method invocation. `some_method` invokes the passed in proc by invoking the `Proc#call` method on the passed in `Proc` object.

So the above is an example of a closure using `Proc` objects.

## How does Ruby implement Closures?

Ruby implements closures in three ways:

- `Proc` objects
- Lambdas
- Blocks

All of these closure types can be passed into methods and executed at a later time.

## What is a closure's binding?

A closures binding is the set of local variables, methods and constant names in its surrounding environment or context where it is defined and that it retains references to and carries it around with itself wherever it is passed to.

A closure keeps track of its binding, so that later when it is executed, it has all the information it needs to be executed correclty.

This execution could be in a scope where those names might be out of scope but it can still refer to them and even reassign them if required.

For example:

```ruby
def a_method
  yield
end

str = "Hello"

a_method { str = "Bye"}

puts str # Bye
```

In the above code, the block `{ str = "Bye"}` is passed to the `a_method` method invocation on line x. This is the line where the block is being defined. The `str` local variale which is initialized on line x, before the block is defined, is part of the block's binding. The block is being executed inside the method `a_method` when `yield` is invoked and `str` is not in scope inside this method. But when we see the output on line XX, we can see that `str` has been reassigned to `"Bye"`. This is because the block `{ str = "Bye"}`retains a reference to local variable `str` (it is part of the block's binding) and carries this reference around with itself when it is passed into the method `a_method`. That is why the block can reference `str` and even reassign it when the block is executed inside `a_method`.

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

In the above code, the block `{ str = "Bye"}` is passed to the `a_method` method invocation on line x. This is the line where the block is being defined. But it is being executed inside the method `a_method` when `yield` is invoked and `str` is not in scope inside this method. But when we see the output on line XX, we can see that `str` has been reassigned to `"Bye"`. This is because the block `{ str = "Bye"}`retains a reference to local variable `str` (it is part of the block's binding) and carries this reference around with itself when it is passed into the method `a_method`. That is why the block can reference `str` and even reassign it when the block is executed inside `a_method`.



# How blocks work, and when we want to use them.

__How to create blocks
How to pass blocks to methods
How to invoke blocks
How to pass arguments to blocks
return value of blocks
when we want to use blocks__

## What are blocks?

Blocks are a type of closure in Ruby and are created using either the `{...}` syntax or the `do..end` syntax. They are unnamed pieces of code that can be passed to method calls as arguments. The method implementation then decides what to do with this block. It can execute the block by yielding to it with the keyword `yield` or it can totally ignore the block.

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

We need to study the method's documentation or play around with the method to find out how passing a block to the method effects the method's return value.

## Return value of blocks

Just like methods, they have a return value which is the evaluated result of the last line of code executed in the block.This return value is returned by the `yield` keyword.

For example:
```ruby
def output
  puts yield
end

output {"Hello World"} # Hello World
```
In the above example, we invoke the `output` method on line x and pass in a block `{"Hello World"}`. The `output` method invokes the block that was passed in using the keyword `yield`. The block `{"Hello World"}` only contains one expression so that is the last expression evaluated in the block and the return value of this expression is returned by the block which is simply the string `"Hello World"`. This string is the output by `puts`. So we can see that `yield` returns whatever the block returns. And blocks return the evaluated result of the last expression evaluated within that block, similar to methods.

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

In Ruby, blocks and `proc`s have a **lenient** arity which is why blocks or `Proc` objects don't raise an error if you dont pass enough or pass more arguments than what are expected i.e. defined as block or Proc parameters.

If more arguments are passed to the block or `Proc` object than are defined by the number of block or `Proc` parameters, then the extra arguments are ignored.

If less arguments are passed to the block or `Proc` object than are defined by the number of block or `Proc` object parameters, the extra block/ Proc local variables are assigned to nil.

### Methods and Lamdas arity

Methods and Lambda's have a strict arity. Methods and Lambda's must be passed the exact number of arguments as defined by the method/lamda parameters. 

If less or more arguments are passed to a method or lamda, Ruby raises an `ArgumentError`.

## When do we want to use blocks in our code?

There are two major use cases for blocks:

1. Create a generic method whose implementation can be refined at method invocation time for a specific use case without modifying the method's implementation for everyone else. This implementation detail is passed in to the method invocation as a block. This allows us to defer some implementation details of the method to method invocation time. For example consider the below `each` method that can be used to iterate through an array:

```ruby
def display_greeting(str)
  puts yield(str)
end

display_greeting("hello") { |str| "**!!#{str.upcase}!!**"}
```
In the above example, we invoke the `display_greeting` method and pass in a string `"hello"`as an argument. We also pass in a block `{ |str| "**!!#{str.upcase}!!**"}` specifying the implentation details about how the greeting should be displayed. 
The `display_greeting` method invokes the block that is passed in with the keyword `yield` and passes in the string to the block that was passed in to the `display_greeting` method and assigned to `str`. When the block is done formatting the string that was passed in (i.e. block execution is complete) and returns the formatted string, it is passed to `puts` which outputs it to the console.

The `display_greeting` is defined in a such a way that anyone can use this method to display a greeting in whatever formatting they wish by passing in those details as a block. `display_greeting`'s responsibility startd and finishs with just outputting what is returned by the block.

**The second use case:**

Methods that need to perform some before and after action. 

Another usecase for blocks is when we need to sandwich some code between some before and after actions. So the method's sole responsibility is to perform this before and after actions. Before and after anything. This anything is passed into the method as a block. 

So again, similar to the above use case, the method is generic in its implementation and it is refined by passing in a block.

A very simple example of this is given below:

```ruby
def greet(name)
  first_name = name.split.first.capitalize

  puts yield(first_name)


end

greet("lily evans")) { |name| "Hi, #{name}. How are you today?"}

```

In the above example, we invoke the `add_one` 

# Blocks and variable scope

A method invocation block creates a new scope for local variables known as the inner scope. Local variables initialized in an outer scope (outside the block) are accessible in an inner scope (inside the block) while local variables initialized in an inner scope are not accessible in the outer scope.

The reason why inner scope can access local variables in an outer scope is because of what is known as the binding of closures (in this case a block). A closur's binding is the set of local variables, methods and constant names in its surrounding environment or context where it is defined and that it retains references to and carries it around with itself wherever it is passed to. 

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

# Write methods that use blocks and procs

```ruby
def each(ary, &block)
  indx = 0

  while indx < ary.size
    block.call(ary[indx])

    indx += 1
  end
end

each([1,2,3]) { |ele| puts ele}

```

```ruby
def each(ary, a_proc)
  indx = 0

  while indx < ary.size
    a_proc.call(ary[indx])

    indx += 1
  end
end
```

# Understand that methods and blocks can return chunks of code (closures)

Methods and Blocks can return closures. We cannot return blocks but we can return procs and lamdas.

When a method is defined to return a closure e.g. a proc, the closures returned by different method calls of the same method would have private/independant copies of any local variables that are part of the closures' binding.

For example:

```ruby
def some_method
  str = "Hello"
  Proc.new { str += " World" }
end

a_proc = some_method
p a_proc.call # "Hello World"
p a_proc.call # "Hello World World"

b_proc = some_method
p b_proc.call # "Hello World"

p a_proc.call # "Hello World World World"

```

In the above code, two different `Proc` objects are returned by the two `some_method` method invocations on lines xx and xx and assigned to the local variables `a_proc` and `b_proc` respectively. Each of these `Proc` objects has a private copy of the method local variable `str` as part of its binding. We can see this when we call the `Proc` objects repeatedly. 

When `a_proc` is called the first time on line xx, `str` has been reassigned to `"Hello World"` and after the second call to `a_proc` on line xx, `str` has been reassigned to `"Hello World World`.

When `some_method` is invoked a second time on line xx, a different `Proc` object is returned which also has the `str` local variable as part of its binding but this `str` is independent from the `str` local variable that is part of the `a_proc`'s binding. We can see this when we call `b_proc` the first time on line xx; `str` references `"Hello World"`. And when we call `a_proc` again on line xx, we can see that `str` has been reassigned to `"Hello World World World"`. If it were the same `str` that was part of the `b_proc`'s binding, it should have been reassigned to `"Hello World World"`. But that is not the case. So this confirms our understanding that `a_proc` and `b_proc` have independent copies of the same local variable `"str"` as part of their bindings.

## Closures can return closures

```ruby
a_proc = Proc.new do
  Proc.new { "Hello World"}
end

p a_proc.call # #<Proc:0x0000023ec3e5a160 e:/RB130/2nd_pass/Blocks/general.rb:2>
```

In the above example, we instantiated a new `Proc` object on line xx and assigned it to the local variable `a_proc`.
When `a_proc` is invoked the first time using the `call` method on line x, it returns a `Proc` object which is output by line x. This is because the last line executed within `a_proc` is `Proc.new { "Hello World"}` which returns a new `Proc` object. `Proc` objects return whatever is returned by the last line executed within the `Proc`.


# Methods with an explicit block parameter

We can define a method to take an explicit block as an argument. 

An explicit block is one that gets assigned to a method local variable (defined as a method parameter) as an object. This allows us to pass it to other methods, reassign it and invoke it as many times as needed.

We can define a method to take an explicit block, by defining it with a parameter that is prepended by the `&` character. The `&block` coverts a block argument to a simple `Proc` object.

AN explicit block provides us with a way to refer to the block (a handle). The variable that references this `Proc` object can be passed to other methods.

Ruby converts blocks passed in as explicit blocks to simple `Proc` objects.

For example:

```ruby
def output(&block)
  puts block.call
end

output { "Hello World" }
```

In the above example, the `output` method is defined with the parameter `&block`. When we invoke the `output` method on line x, we also pass a block to it. The `&` converts the block passed in to the method invocation to a simple `Proc` object and gets assigned to the method local variable `block`. So now we can reference this `Proc` object like any other object, pass it to other methods or invoke this `Proc` object as many times aS required. In this case, we simply invoke the `Proc` object referenced by `block` by invoking the `Proc#call` method on the object referenced by `block` and output the return value which is a string object `"Hello World"`.


# Arguments and return values with blocks

We can pass arguments to blocks by passing them to `yield` when we invoke the block. For example,

```ruby
def greet(name)
  first_name = name.split.first
  puts yield(first_name)
end

player1 = "Bob Lee"

greet(player1) { |name| "Hi, #{name}"}
```
In the above example, we are invoking the `greet` method and passing in `player1` as the argument as well as passing in a block which provides the implentation details about what the greeting message should be. The block defines a block parameter `name` which is interpolated into the string `"Hi, #{name}"`. Inside the `greet` method we first retrieve the first name of argument thats passed in on line x. Then we invoke the block that was passed to the method invocation using the keyword `yield` and we pass the `first_name` to the block by passing it to `yield`. This argument is assigned to the block local variable `name` and interpolated in to the string `"Hi, #{name}"`. As this is the last expression executed in the block, the block returns the evaluated result i.e. `"Hi, Bob"`. This string is returned by `yield` and passed to `puts` and output to the console.

# When can you pass a block to a method

In Ruby, all methods can take an implicit block as an optional argument. The way the block is used by the method depends on the method implementation. The method implentation can completely ignore the block or use it in anyway required. 

# &:symbol

## How does the the proc to block `&` operator work with arguments to methods?

When the `&` operator is applied to an object being passed to a method as an argument, Ruby trys to convert that object to a block. If this object is a `Proc` object this conversion happens automatically.

If, however, the object is not a `Proc` object, Ruby trys to call the object's `to_proc` method first (if it has one) and convert it to a `Proc` object. If it is able to successfully convert the object to a proc then `&` converts that proc to a block. If the object does not have a `to_proc` method, Ruby raises an error

`&:to_s` creates a proc that invokes the `to_s` method on a passed object.




