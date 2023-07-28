class DNA
  def initialize(string)
    @string = string
  end

  def hamming_distance(other_strand_string)
    if @string.size < other_strand_string.size
      shorter = @string
    else
      shorter = other_strand_string
    end
  
    distance = 0
    shorter.size.times do |index|
      if @string[index] == other_strand_string[index]
        next
      else
        distance += 1
      end
    end
  
    distance
  end
end