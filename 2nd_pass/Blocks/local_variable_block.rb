def call_me(some_proc)
  some_proc.call
end



chunk_of_code = Proc.new { puts "hi #{name}"}

name = "Griffin"

call_me(chunk_of_code)