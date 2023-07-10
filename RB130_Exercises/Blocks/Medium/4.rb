def group(array)
# yield the content of the array to a block
# assign block parameter to elements of the array
# ignore first two elements, group all remaining elements as a raptors array

  yield(*array)
end

birds = ['raven','finch','hawk','eagle']

group(birds) {|_,_,*raptors| p raptors}