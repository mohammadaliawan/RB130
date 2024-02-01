
def each(ary)
  # iterate through the elements of the array 
    # on each iteration yield the current element to the block
  counter = 0

  while counter < ary.size
    yield(ary[counter])
    
    counter += 1
  end
  
  ary
end

ary = [1,2,3]

p each(ary) { |ele| print ele + 1}