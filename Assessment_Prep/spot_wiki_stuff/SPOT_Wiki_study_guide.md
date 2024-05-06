Index
AA Closures
aa1 Closures
aa2 Binding
aa3 Proc
aa4 Lambda
aa5 Blocks
aa6 When to use blocks
aa7 Explicit Block Parameter
aa8 Local block variable
aa9 Kernel#block_given?
aa10 Yielding
aa11 Yielding with an argument
aa12 Lenient Arity
aa13 Strict Arity
aa14 &
aa15 & to_proc

BB Testing
bb1 Assert Yourself: A Detailed Minitest Tutorial
bb2 Domain Specific Language (DSL)
bb3 Test Suite
bb4 Testing
bb5 Testing Framework
bb6 Assertion Methods
bb7 Refutation Methods
bb8 SEAT Approach
bb9 Code Coverage

CC Iteration
cc1 Internal Iteration
cc2 external Iteration

DD Ruby Tools
dd1 RubyGems
dd2 Version Managers
dd3 Bundler
dd4 Rake

AA New Section CLOSURES

# aa1 Closures

Closures are a "chunk of code" and can be saved for later use. Surrounding artifacts (variables, methods, objects) are bound to this "chunk of code" and allows the code to reference them when the closure is executed at a later time. Closures are like methods without names that can be passes around within a program. `Block`s, `Proc`s and `lambda`s are all examples of closures. Closers can be returned from a method or block in the form of Proc's and lambda's.

# aa2 Binding

Closures are bound to their surrounding artifacts, meaning the closures retain the references to their surrounding artifacts (methods, variables, objects, etc.) at the time of definition when they are called later.

```ruby
def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

call_me(chunk_of_code) #=> "Griffin III"
```

The `chunk of code` remembers the `name` variable aand changes that are made to it even after the Proc has been defined, this is called binding.

# aa3 Proc

A Proc is instance object of the Proc class and assigns a variable to a block that can be passed into methods or another Proc to then be invoked. When added to methods, be aware that a Procs will end the calling method excecution if the Proc explicitly calls the return statement because Proc's do not return control back to the calling method. Proc's have lenient arity and will not raise an error when the number of arguments passed in do not match the parameters.

# aa4 Lambda

Lambda's are part of the `Kernel` module and are equivalent to `Proc.new`, but with a few differences. Lambda's are a proc object. Lambda's have strict arity and will raise an error if the number of arguments passed in does not match the defined parameters. Lambda's cannot be instantiated with the `new` method. Lambda's do not end method excecution even if the return statment is explicitly stated (unlike Proc's), but will return the control back to the calling method once the lambda has finished excecuting.

# aa5 Blocks

Blocks are defined by `do...end` statements and `{ }` and can be passed into any method. Blocks are not objects and therefore cannot be assigned to local varia bles. Methods must be defined in a way to use passed in blocks or the method will ignore the block. Blocks are an implicit parameter in all methods and are not part of the method definition. Blocks can be thought of as 'un-named methods' or 'anonymous methods'. The return value of a block is determined by its last expression. Block have a lenient arity and will not raise an error when the number of arguments passed in do not match the parameters.

Example:

```ruby
# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call # raises error
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # raises error

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal') # raises error because no block

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}
=begin
Group 1:

A new Proc object can be created with a call of proc instead of Proc.new
A Proc is an object of class Proc
A Proc object does not require that the correct number of arguments are passed to it. If nothing is passed, then nil is assigned to the block variable.

Group 2

A new Lambda object can be created with a call to lambda or ->. We cannot create a new Lambda object with Lambda.new
A Lambda is actually a different variety of Proc.
While a Lambda is a Proc, it maintains a separate identity from a plain Proc. This can be seen when displaying a Lambda: the string displayed contains an extra "(lambda)" that is not present for regular Procs.
A lambda enforces the number of arguments. If the expected number of arguments are not passed to it, then an error is raised.

Group 3

A block passed to a method does not require the correct number of arguments. If a block variable is defined, and no value is passed to it, then nil will be assigned to that block variable.
If we have a yield and no block is passed, then an error is thrown.

Group 4

If we pass too few arguments to a block, then the remaining ones are assigned a nil value.
Blocks will throw an error if a variable is referenced that doesn't exist in the block's scope.

Comparison

Lambdas are types of Proc's. Technically they are both Proc objects. An implicit block is a grouping of code, a type of closure, it is not an Object.
Lambdas enforce the number of arguments passed to them. Implicit blocks and Procs do not enforce the number of arguments passed in.
=end
```

# aa6 sub-section When to use blocks?

1. Defer some implementation code to method invocation decision.

   When the method implementor doesn't know the desired outcome then we can delegate that specific implementation to the method caller through the caller passing in a block. The method will take the block upon invocation and finalize the desired implementaion of the method based on the block passed in.
   Example:

   ```ruby
   [1,2,3,4,5].select {|n| n.odd?}
   #the block allows the caller of the `select` method to determine what is being selected.
   ```

   Without the block in this case we would need a specific method `select_odd`. Specific methods for every possible senario would have to be defined, `select_even`, `select_prime`, etc.

2. Methods that need to perform some "before" and "after" actions - sandwich code.

   We use blocks when we want a before and after within a method. What comes in between will be up to the method caller.

   Example:

   ```ruby
   def time_it
     time_before = Time.now
     yield                       # execute the implicit block
     time_after= Time.now
     puts "It took #{time_after - time_before} seconds."
   end
   time_it { sleep(3) }                    # It took 3.003767 seconds.
                                           # => nil
   time_it { "hello world" }               # It took 3.0e-06 seconds.
                                           # => nil
   ```

   Timing, logging, notification systems are all examples where before/after actions are important.

# aa7 Explicit Block Parameter

We can make a explicit block argument for a method by defining a parameter variable it will be assigned to with `&` prepended to the variable name. The variable assigned to the block can be referenced within the method definintion without the use of `&`. By defining an explicit block parameter we are able to reference the block within the method and pass the block to other methods allowing for more flexibility.

# aa8 Block local variables

The block can contain a block parameter defined within `||`. The block local variable within the `||` must be unique or we will encounter variable shadowing and loose access to variables outside the block scope. Block local variables are scoped to the block.

# aa9 Kernel#block_given?

Methods with a `yield` keyword will raise an `LocalJumpError` if no block is passed in. Hence we use `Kernel#block_given?` to create a condition, only call `yield` if a block is passed in. `Kernel#block_given?` uses the `yield` keyword to determine its results. If `yield` would execute some code and not raise an error then `Kernel#block_given?` will return `true`, but if `yield` would raise an error in the current context then `Kernel#block_given?` will return `false`.

# aa10 Yielding

The `yield` keyword within a method definition is required to execute an implicit block passed in. The method still requires the expected number of arguments to be passed in regardless of the block passed in.
`Yield` allows us to inject functionality in the form of a block anywhere within the method definition without modifying the existing method implementation.

# aa11 Yielding with an argument

Example:

```ruby
# method implementation
def increment(number)
  if block_given?
    yield(number + 1)
  end
  number + 1
end

# method invocation
increment(5) do |num|
  puts num
end
```

# aa12 Lenient Arity

Blocks and Proc's do not raise an error when the the number of arguments passed in does not match the expected number of arguments.

# aa13 Strict Arity

Methods and Lambda's will raise an error when the the number of arguments passed in does not match the expected number of arguments.

# aa14 &

`&` within the method parameter converts the explicit block into a simple Proc object and assigns it to a variable to be passed around in the method definition and possibly to other methods.

`&` within the arguments of a method invocation turns the argument, if a Proc, then into a block. If not a Proc obj then `&` will try to convert it to a proc by calling `to_proc` on the argument. If the argument doesn't have the `to_proc` method then it will raise an error and if it does then it will turn it into a proc obj then into a block.

```ruby
def a_method(&block) # & in a method definition (parameter)
  block.call
  block.call
end

my_proc = Proc.new { puts 'hi' }

a_method(&my_proc) # & in a method invocation turns proc into a block

a = 'friend'
a_method(&a) # tries to call a.to_proc, and will throw an error

```

# aa15 &.to_symbol

`&:symbol` will call the `to_proc` method on the symbol and then convert that proc into a block and then pass that block into the method.

```ruby
arr = [1, 2, 3, 4, 5]

p arr.map(&:to_s)

# :to_s.to_proc -> block

p arr.map { |n| n.to_s }
```

BB New Section TESTING

# RSpec vs Minitest

Minitest uses ruby syntax and used to be distributed with Ruby but has changed in recent years. RSpec uses DSL and reads like English

# bb1 Assert Yourself: A Detailed Minitest Tutorial Assert Yourself: A Detailed Minitest Tutorial

Blog link : https://launchschool.medium.com/assert-yourself-a-detailed-minitest-tutorial-f186acf50960

# bb2 Domain Specific Language (DSL)

any nongeneral computer programming language specific to where it is being implemented (its domain).

# bb3 Test Suite

The collection of all the tests for the entire program or project.

# bb4 Test

The situation or contexts in which an assertion is executed. A test can have multiple assertions.

# bb5 Testing Frameworks remember

They provide:

1. a way to describe what kind of test you want
2. a way to execute those tests
3. a way to report the results of the tests

# bb6 Assertion Methods

The actual verification step that confirms whether the outcome of the program is what you were expecting. A test can have multiple assertions.

Assertion---------------------------Description
assert(test)------------------------Fails unless test is truthy.
assert_equal(exp, act)--------------Fails unless exp == act.
assert_match(exp, act)--------------Fails unless return value of act == exp
assert_same(exp, act)---------------Fails unless exp.equal?(act).
assert_nil(obj)---------------------Fails unless obj is nil.
assert_empty(obj)-------------------Fails unless obj is empty.
assert_raises(*exp) { ... }---------Fails unless block raises one of *exp.
assert_output(exp) {...}------------Fails unless output of block == exp
assert_instance_of(cls, obj)--------Fails unless obj is an instance of cls.
assert_kind_of(clc, obj)------------Fails unless obj is an instance of the named class or one of the named class's subclasses.
assert_includes(collection, obj)----Fails unless collection includes obj.

# bb7 Refutation Methods

refute_equal(exp, act)
refute_includes(collection, obj)
refute_kind_of(clc, obj)
etc...

# bb8 SEAT Approach

1. set up necessary objects
2. execute the code against the object we're testing
3. assert the results of the execution
4. tear down and clean up any lingering artifacts

# bb9 Code Coverage

How much of the code is tested by a test suite.

# bb10 Regression Testing

Regression tests check for bugs that occur in formerly working code after you make changes somewhere in the codebase. Using tests to identify these bugs means we don't have to verify that everything works manually after each change.

CC New Section Iteration

# cc1 Internal Iteration

`map` and `each` methods are examples of internal iteration. They are called that because the process and implementation of iterating through the collection is hidden from us.

# cc2 External Iteration

"This is iteration that takes place at the behest of the user." -LS

DD New Section Ruby Tools

# dd1 Rubygems

Also just called `Gems`, RubyGems are packages of code that one can download and use in their program or from the command line to streamline a certain action or task. Gems are managed by the `gem` command that comes with Ruby.

# dd2 Version Managers

Version managers allow one to manage and use multiple versions of Ruby. This allows us to work on multiple projects that each use a different version of Ruby without trouble.

# dd3 Bundler

Bundler is a Gem that uses a `Gemfile` to manage and tell the program which version of Ruby and Gems we should be using. Bundler must be installed in each version of Ruby we are using if using a Ruby version manager.

# dd4 Rake, RakeFile

Rake is a Gem that helps to streamline project management and development by allowing us to automate many tasks when building, testing, packaging and installing. Rake is included in modern Ruby installation.

A Rakefile is a Ruby program hence we can write Ruby code within in for execution. Commands like `desc` and `task` are just method calls to those parts of the Rakefile. These method calls are examples of DSL.

Example

```ruby
require "bundler/gem_tasks"
require "rake/testtask"
require 'find'

desc 'Say hello'
task :hello do
  puts "Hello there. This is the 'hello' task."
end

desc 'find files'
task :find do
  Find.find('.') do |name|
    next if name.include?('/.')
    puts name if File.file?(name)
  end
end


desc 'Run tests'
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end
```

# dd5 Projects

A Ruby project is a program or library whose dominant coding language is Ruby.