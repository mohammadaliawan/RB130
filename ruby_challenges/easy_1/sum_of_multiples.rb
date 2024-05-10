class SumOfMultiples
  def initialize(*set_of_nums)
    @set_of_nums = [3, 5] if set_of_nums.empty?
    @set_of_nums = set_of_nums unless set_of_nums.empty?
  end

  def self.to(first_number)
    new.to(first_number)
  end

  def to(first_number)
    multiples = (1...first_number).select do |possible_multiple|
      @set_of_nums.any? do |current_num_in_set|
        possible_multiple % current_num_in_set == 0
      end
    end

    multiples.sum
  end
end
