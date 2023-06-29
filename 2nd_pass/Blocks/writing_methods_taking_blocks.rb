# def hello
#   "hello!"
# end

# p hello { puts "hi"}

# def echo_with_yield(str)
#   yield if block_given?
#   str
# end

# p echo_with_yield("Hello!") 

# def say(words)
#   yield if block_given?
#   puts "> " + words
# end

# say("hi there") do
#   system 'clear'
# end

# def increment(num)
#   if block_given?
#     yield(num + 1)
#   end
#   num + 1
# end

# increment(3) do |value|
#   puts "Hello! incremented value is #{value}"
# end

# def test
#   yield(1, 2)
# end

# test { |num| p num}

# def compare(str)
#   puts "Before: #{str}"
#   after = yield(str)
#   puts "After: #{after}"
# end

# compare("Hello") { |str| str.upcase}

# compare("hello") { |str| str[0..2]}

# compare("hello") { |str| "Whatever"}

# def time_it
#   puts "Before: #{before = Time.now}"
#   yield if block_given?
#   puts "After: #{after = Time.now}"
#   puts "It took #{after - before} seconds"
# end

# time_it do
#   sleep(3)
#   puts "Hello World!"
# end

def for_each_in(ary)
  ary.each { |element| yield(element)}
end

ary = [1,2,3,4,5]
results = [0]

for_each_in(ary) do |number|
  total = results[-1] + number
  results.push(total)
end

p results