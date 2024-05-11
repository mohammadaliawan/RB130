### What is the SEAT approach?

**SEAT** is an acornym for Set up, Execute, Assert, Tear down.

These are the 4 steps of writing tests:

1. Set up  - Instantiate any objects that will be used in the tests.
2. Execute the code that we are testing using the objects instantiated in the setup step.
3. Assert - make assertions to verify that the executed code behaved as expected.
4. Tear down - Clean up, log or close any file etc.

Quiz: Including Set Up and Tear Down steps reduces redundancy in the test suite.
The `setup` method runs before each test and the `teardown` method runs after each test.

### How does `assert_equal` test for equality?

It compares the objects using the `#==` method.

### Can SEAT approach be used with Minitest as well as RSpec?

The SEAT approach can be used with any testing tool. It is just an approach to writing tests. 

#### Set up

Setting up objects to exeute code against later:

```ruby
def setup
  @car = Car.new
end
```

We need to assign our set up objects to instance variables so that they are in scope in the other `test_instance_method` instance methods.

The `setup` method will be called before running each test and the `teardown` method will be called after running each test.