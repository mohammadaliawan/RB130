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

## Blocks can return Procs

```ruby
def some_method
  yield
end

a_proc = some_method do
  num = 1
  Proc.new { num += 1}
end

p a_proc.call

```

```ruby
a_proc = Proc.new do
  Proc.new { "Hello World"}
end

p a_proc.call # #<Proc:0x0000023ec3e5a160 e:/RB130/2nd_pass/Blocks/general.rb:2>
```

In the above example, we instantiated a new `Proc` object on line xx and assigned it to the local variable `a_proc`.
When `a_proc` is invoked the first time using the `call` method on line x, it returns a `Proc` object which is output by line x. This is because the last line executed within `a_proc` is `Proc.new { "Hello World"}` which returns a new `Proc` object. `Proc` objects return whatever is returned by the last line executed within the `Proc`.