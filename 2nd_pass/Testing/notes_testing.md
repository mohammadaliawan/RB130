# Testing

### Why do we write tests?

Testing is done to prevent regression. We write tests so that when we make changes in our code, we dont have to manually verify everything still works.

Regression: return to a less advanced state, condition of way of behaving.

Code regression means that a formerly working program does not behave as it is exepcted to after you make some changes to it.

Quiz Awnser: primary reason for writing tests is regression testing. Regression tests check for bugs that occur in formerly working code after you make changes somewhere in the codebase. Using tests to identify these bugs means we dont have to verify that everything works manually after each change.

### What is Minitest?

Minitest is an intuitive test library that comes installed with Ruby.

Minitest is Ruby's default testing library and is part of Ruby's standard library. More specifically its a bundled gem.

Bundled Gem: Minitest is shipped with the default Ruby Installation but is maintained outside the Ruby core team and can be uninstalled. 

Bundled gems behave similarly to normal gems, but they are get automatically installed when you install Ruby. They can be uninstalled and are maintained outside the Ruby Core team.

Default gems: These gems are part of Ruby and you can always require them directly. They cannot be uninstalled and are maintained by Ruby core team.

### Differences between RSpec and Minitest

- There are two ways to use Minitest: using its DSL or using simple Ruby syntax. This allows a Ruby developer who doesnt know the DSL to quick get upto speed on how to use Minitest and start writing tests in Minitest using simple Ruby code.
- RSpec is a Domain Specific Language for writing tests. RSpec has a syntax that reads more like natural english but is not considered simple or intuitive.You will have to spend some time to learn this DSL.
- Minitest provides a simpler and more straightforward syntax.

### Similarties between Minitest and RSpec?

- Minitest can do everything RSpec can.
- RSpec does not allow to use Ruby syntax for writing tests. Tests in RSpec are written in a DSL that reads like natural english
- Minitest allows us to use Ruby syntax for writing tests as well as using it DSL.

### What is a Test Suite?
It is the entire set of tests that accompanies your program or application. You can thik of this as all the tests for a project

Quiz: A group or set of situations or contexts within which verification checks are made.

### What is a Test?
Describes a single situation or context in which tests are run. A test can contain multiple assertions

Quiz: A situation or context in which verification checks are made.

### What is an assertion?
This is the actual verification step to confirm that the data returned by your program or application is indeed what is expected. You make one or more assertions within a test.

Quiz: A verification step to confirm that results returend by a program or application match the expected results.

## Using Minitest

### How do you create unit tests for your program?

1. First, your program should be in s seperate file e.g. `car.rb`.
2. Second, the test suite should be in a seperate `.rb` file with the name `project_name_test.rb`.
3. In the `xxx_test.rb`file, we need to `require minitest/autorun`. This loads all the neccessary files from `minitest` gem we need to use Minitest.
4. In the same file we need to tell ruby where the class we are testing is with `require_relative file_name`.
5.  In the `project_name_test.rb` file, we create our test classes e.g.`ClassNameTest` class that subclass from the `MiniTest::Test` class. This will allow our test class to inherit all the neccessary methods for writing tests.
6. Next, we create tests by creating instance methods that start with `test_XXX`. This tells minitest that these methods are individual tests that need to be run.
7. Within each instance method (test) we will need to make some assertions.These assertions are what we are trying to verify.
8. Before making any assertions, we need to setup the appropriate data or objects to make assertions against.

### Reading Minitest output

- `seed` is how you tell Minitest to run the entire test suite in a particular order.
- `.FS` . is for passed test, F is for failed tests and S is for skipped tests.


### Which gem is used to colorize the Minitest output?

We can use the `Minitest-Reporters` gem. It is used in the following way:

```ruby
require 'minitest/reporters'
Minitest::Reporters.use!
```

### How do you skip tests?

By including the keyword `skip` at the beginning of the test.

### What are the two different types of syntaxes used with Minitest?

Assertion or assert-style syntax and Expectation or spec-style syntax.

### How is expectation style syntax used?

- tests are grouped in `describe` blocks and individual tests are written with the `it` method. We dont use assertions, and instead use expectation matchers. 

```ruby
require 'minitest/autorun'
require_relative 'car'

describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    _(car.wheels).must_equal 4
  end
end

```

## Assertions

### What do the following assertions do?

- `assert(test)` - Fails unless test is truthy
- `assert_equal(exp, act)` - Fails unless `exp == act`
- `assert_nil(obj)` - Fails unless `obj` is `nil`
- `assert_raises(*exp) {...}` - Fails unless block raises one of `*exp`
- `assert_instance_of(cls, obj)` - Fails unless `obj` is an instance of `cls`
- `assert_includes(collec, obj)` - Fails unless `collec` includes `obj`

### What are refutations?

Refutations are the opposite of assertions. They refute rather than assert.:
Refutations all take the same arguments as their respective assertions except its doing a refutation. It refutation passes if the match returns false.
Refute: prove to be false

- `assert` opposite is `refute` - Passes if the object passed to it is falsey.
- 

## SEAT

### What is the SEAT approach?

**SEAT** is an acornym for Set up, Execute, Assert, Tear down.

These are the 4 steps of writing tests:

1. Set up the neccessary objects - Instantiate any objects that will be used int he tests.
2. Execute code against the objects we are testing
3. Assert that the executed code did the right thing - Affirm the results of code execution.
4. Tear down and clean up any lingering artifacts

Quiz: Including Set Up and Tear Down steps reduces redundancy in the test suite.
The `setup` method runs before each test and the `teardown` method runs after each test.

### How does `assert_equal` test for equality?

It compares the objects using the `#==` method.

### Can SEAT approach be used with Minitest as well as RSpec?

Minitest and RSpec are testing tools, whereas SEAT is an approach to testing which you can use with either program.

#### Set up

Setting up objects to exeute code against later:

```ruby
def setup
  @car = Car.new
end
```

We need to assign our set up objects to instance variables so that they are in scope in the other `test_instance_method` instance methods.

The `setup` method will be called before running each test and the `teardown` method will be called after running each test.

## Testing Equality

### When we use `assert_equal`, what are we trying to assert? Is it object equality or value equality? or both?

When we use `assert_equal`, we are testing for value equality. We are invoking the `==` method for the calling object.

### Which assertion should be used if we need to check for object equality?

To test for the more strict object equality, that is, the two objects are the same object, we need to use the `assert_same`

### What is an example of testing for value equality vs. object equality?

```ruby
require 'minitest/autorun'

class EqualityTest < Minitest::Test
  def test_value_equality
    str1 = "hi there"
    str2 = "hi there"

    assert_equal(str1, str2)
    assert_same(str1, str2)
  end
end
```    

## Code Coverage

### What is code coverage and how is it tested?

Code coverage is a measure of how much of a program is tested by a test suite. It can be used as a metric to asses code quality.

## Special Questions

Why is using `assert_equal` instead of `assert` a better option to test that `name` returns `"Kitty"`in the below code?

```ruby
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def miaow
    "#{name} is miaowing."
  end
end

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty')
  end

  def test_is_cat; end

  def test_name; end

  def test_miaow; end

  def test_raises_error; end
end
```

Using only `assert` in the above test would only tell us if the test passed or failed without any meaningful context.

### How many arguments does `assert` take and what are they?

`assert` can take two arguments, although the second argument is optional and defaults to `nil`. The first argument is the expression that you want to test. If this expression returns a truthy object the test passes, otherwise it fails. The second optional argument is a message that will be displayed if the test fails.

### Why doez the order of the arguments to `assert_equal` matter?

The first argument to `assert_equal` is the expected result or object and the second argument is supposed to be the actual obj or expression that returns the actual obj.

If this order is reversed, the test might not fail but it could in other cases. If the test did fail the message given by Minitest which is the reason for failure would be misleading since the expected and actual values are reversed. It's good practice to provide the arguments in the correct order.

### Why does the following assertion on line 248 still pass even though no exceptions as arguments are passed to the the `assert_raises` method?

```ruby
require 'minitest/autorun'

class Cat
  def initialize(arg)

  end

end


class CatTest < Minitest::Test
  def test_raise_error
    assert_raises do
      Cat.new(x)
    end
  end
end
```
This assertion passes because we did not pass any exception type to `assert_raises`. If no exception class is passed to this method, the expected expection class defaults to `StandardError`. Line 249 raises a `NameError` which is the subclass of `StandardError`. Since no arguments were passed to `assert_raises`, by default it expects that a `StandardError` or subclass of it will be raised. Hence the test passes.

### Looking at the details of a failed test, you see the following:

```
  1) Failure:
CatTest#test_name [minitest_test.rb:21]:
Expected: "Milo"
  Actual: "Kitty"
```

Which of the following implementations of test_name would produce this result output and which one does not and why?


A: assert_equal(@kitty.name, 'Milo')

Although the above test will fail, but Minitest will report the reason for failure incorrectly. It will show that the expected value is "Kitty" and the actual value is "Milo". The reason for this is that the order in which we have passed the arguments to `assert_equal` are in reverse order. We need to pass "Milo" as the first argument so it becomes the expected value and pass `@kitty.name` as the second argument so the return value of this expression becomes the actual value.

B: assert_equal('Milo', @kitty.name)

This assertion will produce the above failure output.

C: assert(@kitty.name == 'Milo')

This test will also fail because `@kitty.name` will return the string `"Kitty"` which is not equal to `"Milo"`. But the output of this test failure will not be as shown above as `assert` passes if the object passed to it is truthy and fails if it is falsey. It cannot differentiate between the expected value and the actual value.

D: refute_equal('Kitty', @kitty.name)

This test will pass and will not produce the above output as `@kitty.name` will return `"Kitty"` which is equal to expected value `"Kitty"`. Hence this assertion will also not produce the required output.