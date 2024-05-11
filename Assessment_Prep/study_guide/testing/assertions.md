# Assertions

## `assert`

`assert` takes two arguments, with the second one being optional. It tests whether the first argument is truthy i.e. neither `false` nor `nil`. If it is truthy or returns a truthy object, the test passes. If it returns `false` or `nil`, the test fails and the second argument is displayed in the failure message.

When using `assert` it is better to provide the optional second argument that provides some context as to why the assertion failed. The default failure message provided by `assert` does not provide any context regarding the failure of the assertion.

## `assert_equal`

`assert_equal` takes two arguments. The first argument is considered the expected value, while the second argument is the value being tested or the actual value. And it tests for value equality using the `#==` method.

## `assert_empty`

`assert_empty` tests whether the first argument returns `true` when `#empty?` is invoked on it.

## `assert_includes`

`assert_includes` tests whether the first argument has the second argument. It is usually used for collection objects to check if an object is included in an array/hash.

## `assert_raises`

`assert_raises` takes an error/exception type as argument and a block. It tests whether the block raises an error of the type passed as argument.

## `assert_instance_of`

`assert_instance_of` checks if its second argument is exactly an object of the class specified as its first argument.

## `assert_kind_of`

`assert_kind_of` checks if its second argument is an object of the class specified as its first argument or any of its subclasses.

## `assert_same`

`assert_same` checks if the two objects passed in as arguments are the same object using the `#equal?` method i.e. it checks for object equality instead of value equality.

## `assert_nil`

`assert_nil` checks if the argument passed in is `nil` or returns `nil`. Fails if it is not `nil` or does not return `nil`. 


