def some_method(a_proc)
  some_num = 5
  a_proc.call(some_num)
end

factor = 10
add_factor = Proc.new { |num| num + factor}

p some_method(add_factor)