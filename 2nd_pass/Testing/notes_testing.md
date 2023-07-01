# Testing

### Why do we write tests?

Testing is done to prevent regression. We write tests so that when we make changes in our code, we dont have to manually verify everything still works.

Regression: return to a previous and less advanced state, condition of way of behaving.

### What is Minitest?

Minitest is an intuitive test library that comes installed with Ruby.

Minitest is Ruby's default testing library and is part of Ruby's standard library. More specifically its a bundled gem.

Bundled Gem: Minitest is shipped with the default Ruby Installation but is maintained outside the Ruby core team and can be uninstalled. 

Bundled gems behave similarly to normal gems, but they are get automatically installed when you install Ruby. They can be uninstalled and are maintained outside the Ruby Core team.

Default gems: These gems are part of Ruby and you can always require them directly. They cannot be uninstalled and are maintained by Ruby core team.

### Differences between RSpec and Minitest

- Minitest can do everything RSpec can.
- There are two ways to use Minitest: using its DSL or using simple Ruby syntax. This allows a Ruby developer who doesnt know the DSL to quick get upto speed on how to use Minitest and start writing tests in Minitest using simple Ruby code.
- RSpec is a Domain Specific Language for writing tests. RSpec has a syntax that reads more like natural english but is not considered simple or intuitive.You will have to spend some time to learn this DSL.
- Minitest provides a simpler and more straightforward syntax.

### What is a Test Suite?
It is the entire set of tests that accompanies your program or application. You can thik of this as all the tests for a project

### What is a Test?
Describes a single situation or context in which tests are run. A test can contain multiple assertions

### What is an assertion?
This is the actual verification step to confirm that the data returned by your program or application is indeed what is expected. You make one or more assertions within a test.

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

1. Set up the neccessary objects
2. Execute code against the object we are testing
3. Assert that the executed code did the right thing
4. Tear down and clean up any lingering artifacts

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