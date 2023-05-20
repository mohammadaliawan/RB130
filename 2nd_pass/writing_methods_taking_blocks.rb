# def hello
#   "Hello!"
# end

# p hello {puts "hi"}

# def echo(str)
#   puts str
# end

# echo("Hello") { puts "Goodbye!" }

def echo_with_yield(str)
  yield if block_given?
  str
end

p echo_with_yield("Hello") { puts "Goodbye!"}

