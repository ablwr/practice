SHORT_WORDS = ["i", "me", "to", "too", "a", "an", "in", "and", "on"]
VOWELS = ['a','e','i','o','u']

  def to_pig_latin(str)

  words = str.split(" ")

  words.collect do |word|
    if SHORT_WORDS.include?(word)
      word
    else
      letters = word.split("")
      pig_word(letters)
    end
  end.join(" ")
end

def pig_word(letters)
  letters.each_with_index do |letter, i|
    if VOWELS.include?(letter)
      letters << "ay"
      return letters[i..-1].join("")
    else
      letters << letter
    end
  end
end