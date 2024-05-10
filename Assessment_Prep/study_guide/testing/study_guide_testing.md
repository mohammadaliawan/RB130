- Testing terminology
- Minitest vs. RSpec
- SEAT approach
- Testing Equality
- Assertions

# Testing Terminology

## What is testing and Why do we write tests?

Testing is the process of writing and running tests for a codebase to check that it works as expected.The major reason for testing code is to check for regression in our codebase.

Code regression means that a program, that was previously working as expected, stops behaving as expected after we make some changes to it. 

The alternative to writing and running tests for a codebase to prevent regression, would be manually check the entire codebase after you have made changes to it. This is a very time consuming process and not foolproof.

Testing with a test suite that checks each part of our program is very efficient and provides specific clues to where the problem lies in our program.

## Minitest

Minitest is the default testing library for the Ruby programming language. It is a bundled gem that comes as part of Ruby Installation.

## Test Suite

A test suite is the complete collection of tests that are written for a program or project's codebase. It consists of several verifications checks that test the codebase under different contexts or conditions.

## Test

A test is an individual context or condition within a larger collection of tests . For example, we may have a test that checks if a program responds as expexted if a bad input is provided.

## Assertions

An assertion is an individual step within a test that confirms if a particular part of the codebase works as expected. There is an expected result (the data that should be returned) and there is an actual result of running the code. Both are compared in an assertion to check if they match. If they do, the assertion passes and if not the assertion fails. A test may contain several assertions to check all the different return values in a particular context.

## What is unit testing?

Writing tests to test simple classes and methods within those classes to prevent regression in the codebase.

# Minitest vs. Rspec

RSpec and Minitest are both used for writing tests for Ruby Programs but Minitest is the default testing library for Ruby. Minitest is a bundled gem that comes installed with Ruby while RSpec does not.

RSpec is a Domain Specific Language for writing tests that reads like natural english. Minitest can be used both using a Domain Specific Language and simple Ruby Syntax. However, RSpec can only be used via its DSL. Minitest is much simpler to get started with as it allows simple Ruby syntax.

# Assertions

## `assert`

`assert` takes two arguments, with the second one being optional. It tests whether the first argument is truthy i.e. neither `false` nor `nil`. If it is truthy or returna a truthy object, the test passes. If it is or returns `false` or `nil`, the test fails and the second argument is displayed in the failure message.

Whenever `assert` is used in a test, it is useful to provide the second argument that provides some context regarding why the assertion failed. The default failure message displayed by `assert` does not provide any context regarding why the failure occured.

## `assert_equal`

`assert_equal` takes two arguments. The first argument is considered the expected value, while the second argument is the value being tested or the actual value. And it tests for value equality using the `#==` method.

## `assert_empty`

`assert_empty` tests whether the first argument returns `true` when `#empty?` is invoked on it.

## `assert_includes`

`assert_includes` tests whether the first argument has the second argument. It is usually used for collection objects to check if an object is included in an array/hash.

## `assert_raises`

`assert_raises` take an exception type as argument and a block. It tests whether the block raises an error of the type passed as argument.

## `assert_instance_of`

`assert_instance_of` check if its second argument is exactly an object of the class specified as its first argument. 

## `assert_kind_of`

`assert_kind_of` checks if its second argument is an object of the class specified as its first argument or any of its subclasses.

## `assert_same`

`assert_same` checks if the two objects passed in as arguments are the same object using the `#equal?` method i.e. it check for object equality instead of value equality.


