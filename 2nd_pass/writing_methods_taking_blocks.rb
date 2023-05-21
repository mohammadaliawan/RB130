# def hello
#   "hello!"
# end

# p hello { puts "hi"}

# def echo_with_yield(str)
#   yield if block_given?
#   str
# end

# p echo_with_yield("Hello!") 

def say(words)
  yield if block_given?
  puts "> " + words
end

say("hi there") do
  system 'clear'
end
