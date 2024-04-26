def output(value)
  puts yield(value)
end

output(55) { |int| int + 5 }  