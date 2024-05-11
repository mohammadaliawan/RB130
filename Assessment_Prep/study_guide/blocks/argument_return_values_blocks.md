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
In the above example, we are invoking the `greet` method and passing in the object referenced by `player1` as the argument as well as passing in a block which provides the implentation details about what the greeting message should be. The block defines a block parameter `name` which is interpolated into the string `"Hi, #{name}"`. Inside the `greet` method on line x we first retrieve the first name of argument thats passed in . Then we invoke the block that was passed to the method invocation using the keyword `yield` and we pass the `first_name` to the block by passing it to `yield`. This argument is assigned to the block local variable `name` and interpolated in to the string `"Hi, #{name}"`. As this is the last expression executed in the block, the block returns the evaluated result i.e. `"Hi, Bob"`. This string is returned by `yield` and passed to `puts` and output to the console.