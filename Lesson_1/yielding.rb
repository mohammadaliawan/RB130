
# def increment(number)
#   if block_given?
#     yield(number + 2)
#   end
#   number + 2
# end


# increment(5) do |num|
#   puts num
# end

# def test
#   yield(1)
# end

# test { |num, val| puts "#{num}, #{val}"}

# def compare(str)
#   puts "Before: #{str}"
#   after = yield(str)
#   puts "After: #{after}"
# end

# compare("hello") { |word| word[1..2]}

# def time_it
#   time_before = Time.now
#   yield
#   time_after = Time.now

#   puts "It took #{time_after - time_before} seconds."
# end

# # time_it {sleep(3)}
# time_it {puts "Hello World!"}

# def test(&block)
#   puts "What's &block?#{block}Hello"
# end

# test{}

def test2(block)
  puts "Hello"
  block.call(">>>>")
  puts "good-bye"
end

def test(&block)
  puts 1
  test2(block)
  puts 2
end

test { |prefix| puts "#{prefix} xyx"}