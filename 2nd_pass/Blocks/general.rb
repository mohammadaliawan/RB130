# def call_chunk(code_chunk)
#   code_chunk.call
# end
# color = "blue"
# say_color = Proc.new {puts "The color is #{color}"}
# color = "green"
# call_chunk(say_color)

def transform(obj)
  before = obj

  after = yield(obj)

  {before => after}
end

p transform("Hello World") {|string| string.capitalize}