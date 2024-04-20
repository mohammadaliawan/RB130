def a_method
  yield
end
str = "Hello"

a_method { str = "Bye"}

puts str # Bye
