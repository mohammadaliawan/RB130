# Testing

### Why do we write tests?

Testing is done to prevent regression. We write tests so that when we make changes in our code, we dont have to manually verify everything still works.

Regression: return to a previous and less advanced state, condition of way of behaving.

### What is Minitest?

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

### A