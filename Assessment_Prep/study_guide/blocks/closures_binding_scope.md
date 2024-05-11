# Closures, Binding and Scope

## What are Closures? What are the different types of closures in Ruby?

- piece of code
- can be passed around
- executed later
- binding

A Closure is an idea found in many programming languages that describes a "pieces of code" that can be passed around to method invocations just like any other arguments and executed later when required.

A key feature of closures that makes them immensely useful is that they are able to keep track of and access variables names, method names and constant names that exist in the surrounding context where they are defined or created. These surrounding variables/methods/constants names form what is known as the binding of a closure. A closures binding is what allows it to be executed later in a completely different scope and still be able to access the data it needs from its surrounding environment where it was created.

In Ruby, closures are created in three ways: using blocks, `Proc` objects or Lambda's.

### Blocks

Blocks are pieces of code that are delimited by `{}` or `do..end` and passed to method invocations as arguments except they are not objects. It is up to the method implementation to then either invoke the block or to ignore it. Below is an example of a block being passed to the `Array#each` method:

```ruby
some_num = 10
[1,2,3].each do |num|
  puts some_num + num
end

[1,2,3].each { |num| puts some_num + num}
```

In the above example, the `do..end` chunk of code from line x to x and `{ |num| puts num}` on line x are blocks. These blocks are being passed to the `each` method invocation as arguments. The local variable `some_num` is part of the binding of both blocks.

### Procs

`Proc` objects are instantiated from the `Proc` class. They are also a type of closure similar to blocks except `Proc`s are objects and blocks are not. `Proc`s are created by using the `Proc::new` method and passing it a block. Since they are objects, `Proc`s can be assigned to local variables. This `Proc` object can now be referenced by accessing this local variable, can be called using this local variable using `Proc#call` method, passed to method invocations as arguments or even passed to other blocks or `Proc`s as arguments.

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

## What is binding?

 A key feature of closures that makes them immensely useful is that they are able to keep track of and access variables names, method names and constant names that exist in the surrounding context where it is defined or created. These surrounding variables/methods/constants names form what is known as the binding of a closure. A closures drags its binding along wherever it is passed to. This is what allows it to be executed later in a completely different scope and still be able to access the data it needs from its surrounding environment where it was created.

## How does a closure's binding effect its scope?

Closures keep track of and are able to access variable names and methods that exist in the surrounding context where it is defined or created. These variable names and methods etc form what is known as the binding of the closure and closures drag their bindings along wherever they are passed to. This allows them to be executed later in a completely different scope and still be able to access the data they need from the surrounding environment where they were created. 

The reason local variables initialized outside blocks are able to be accessed inside blocks is because these variables are part of the block's binding. 

**For example:**

```ruby
def a_method
  yield
end

str = "Hello"

a_method { str = "Bye"}

puts str # Bye
```

In the above code, the block `{ str = "Bye"}` is passed to the `a_method` method invocation on line x. This is the line where the block is being defined. The `str` local variale which is initialized on line x, before the block is defined, is part of the block's binding. The block is being executed inside the method `a_method` when `yield` is invoked and `str` is not in scope inside this method. But when we see the output on line XX, we can see that `str` has been reassigned to `"Bye"`. This is because the block `{ str = "Bye"}`retains a reference to local variable `str` (it is part of the block's binding) and carries this reference around with itself when it is passed into the method `a_method`. That is why the block can reference `str` and even reassign it when the block is executed inside `a_method`.
