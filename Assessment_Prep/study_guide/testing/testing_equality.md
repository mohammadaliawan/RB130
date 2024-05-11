## Testing Equality

***DONOT USE!! Copied from Launchschool Material***

### When we use `assert_equal`, what are we trying to assert? Is it object equality or value equality? or both?

When we use `assert_equal`, we are testing for value equality. We are invoking the `==` method for the calling object.

### Which assertion should be used if we need to check for object equality?

To test for object equality, that is, the two objects are the same object, we need to use the `assert_same`

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