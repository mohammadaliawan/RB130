require 'stringio'

str = StringIO.new("20\n30\n")

# input = str.gets.chomp
# input2 = str.gets

p str.read(3,3)
