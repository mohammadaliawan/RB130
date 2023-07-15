items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# gather(items) do |*someitems, other_item |
#   puts someitems.join(", ")
#   puts other_item
# end

# gather(items) do |apples,*produce,wheat|
#   puts apples
#   puts produce.join(', ')
#   puts wheat
# end\

# gather(items) do |apples, *produce|
#   puts apples
#   puts produce.join(", ")
# end

gather(items) do |apples,corn,cabbage,wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end

