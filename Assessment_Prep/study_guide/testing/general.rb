def some_method
  yield
end

a_proc = some_method do
  num = 1
  Proc.new { num += 1}
end

p a_proc.call
p a_proc.call