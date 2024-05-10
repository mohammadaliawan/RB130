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

