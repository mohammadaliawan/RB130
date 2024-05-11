# Methods with an explicit block parameter

All method invocations in Ruby can take an optional block as an implicit argument. 

However, we can also define a method to take a block as an explicit argument, by defining it with a method parameter that is prepended by the `&` character. The `&` coverts any block argument to a simple `Proc` object and assigns it to a method local variable. This provides us with a handle to access the `Proc` object, pass it around to other methods and invoke it as many times as needed.

For example:

```ruby
def output(&a_proc)
  puts a_proc.call
end

output { "Hello World" }
```

In the above example, the `output` method is defined with the parameter `&a_proc`. When we invoke the `output` method on line x, we also pass a block to it `{ "Hello World" }`. The `&` converts the block passed in to the method invocation to a simple `Proc` object and assigns to the method local variable `a_proc`. So now we can reference this `Proc` object like any other object, pass it to other methods or invoke this `Proc` object as many times aS required. In this case, we simply invoke the `Proc` object referenced by `a_proc` by invoking the `Proc#call` method on the object referenced by `a_proc` and output the return value which is a string object `"Hello World"`.
