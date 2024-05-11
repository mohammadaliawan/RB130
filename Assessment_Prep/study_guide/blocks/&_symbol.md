# When can you pass a block to a method

In Ruby, all method invocations can take an optional block as an implicit argument. The way the block is used by the method depends on the method implementation. The method implentation can completely ignore the block or use it in anyway required. 

# &:symbol

## How does the the proc to block `&` operator work with arguments to methods?

When the `&` operator is applied to an object being passed to a method as an argument, Ruby trys to convert that object to a block. If this object is a `Proc` object this conversion happens automatically.

If, however, the object is not a `Proc` object, Ruby trys to call the object's `to_proc` method first (if it has one) and convert it to a `Proc` object. If it is able to successfully convert the object to a proc then `&` converts that proc to a block. If the object does not have a `to_proc` method, Ruby raises an error

When `&:to_s` is passed to a method invocation as an argument, Ruby first converts the symbol `:to_s` to a `Proc` object by invoking the `Symbol#to_proc` method on `:to_s`. That returns a `Proc` object. Then the `&` converts this `Proc` object to the block `{ |n| n.to_s }`. This block is then passed to the method invocation.
