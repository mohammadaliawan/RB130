# def any?(ary, &block)
#   ary.each do |ele|
#     return block
#   end
# end

# def none?(ary, &block)
#   return false if any?(ary, &block)
#   true
# end



# p any?([1, 3, 5, 6]) {"SOmething"}

# def somemethod(x: 1)


# end

# somemethod(x: 2)

def somemethod(&block)
  p block.call 2
end

somemethod(&:to_s)