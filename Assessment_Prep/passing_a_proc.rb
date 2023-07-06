# Problem
def call_this
	yield(2)
end

# How to get the following return values with modifying the method invocation nor the method definition
call_this(&to_s) # => returns 2
call_this(&to_i) # => returns "2"

# Solution
to_s = Proc.new { |num| num.to_i } # Define these before the method invocations
to_i = Proc.new { |num| num.to_s }