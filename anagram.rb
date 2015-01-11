class Anagram
  attr_accessor :word

  def initialize(word)
    @word = word
  end

  def match(word_array)
    possible_matches = []

    word_array.each do |item|
      if item.length == word.length
        possible_matches << item
      end
    end

    possible_matches.select do |item2|
      item2.split("").sort == word.split("").sort
    end
  end

end