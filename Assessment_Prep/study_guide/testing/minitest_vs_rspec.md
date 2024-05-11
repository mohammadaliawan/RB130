# Minitest vs. Rspec

RSpec and Minitest are both used for writing tests for Ruby Programs but Minitest is the default testing library for Ruby. Minitest is a bundled gem that comes installed with Ruby while RSpec does not.

RSpec is a Domain Specific Language for writing tests that reads like natural english. Minitest can be used both using a Domain Specific Language and simple Ruby Syntax. However, RSpec can only be used via its DSL. Minitest is much simpler to get started with as it allows tests to be written using simple Ruby syntax.

# Spec style

We can use Minitest to write tests in two different syntaxes. The assert-style syntax is the one where we write tests using assertions. We use simple Ruby code (instance methods and classes) to write tests as instance methods that contain assertions that compare the actual data returned by the executed code with the expected data.

The second syntax is the expection or spec-style syntax where we use a Domain Specific Language to write tests. Tests are grouped in `describe` blocks and each test is written using the `it` method. Instead of assertions, we use expectation matchers.