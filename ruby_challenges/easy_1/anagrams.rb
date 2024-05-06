class Anagram
  def initialize(word)
    @word = word
  end

  def match(list)
    anagrams = []

    list.each do |possible_anagram|
      if anagram?(possible_anagram)
        anagrams << possible_anagram
      end
    end

    anagrams
  end

  def anagram?(possible_anagram)
    @word.downcase != possible_anagram.downcase &&
      @word.downcase.chars.sort ==
        possible_anagram.downcase.chars.sort
  end
end
