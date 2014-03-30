## This program translates standard English text into a modified language similar to Pig Latin known as Gibberish.
# To understand how this language works, check out this wikipedia page: http://en.wikipedia.org/wiki/Gibberish_(language_game)
# My mother taught it to me as a child, so this program is almost as fast as I am in casual conversation. ;)
# An example of a translation would be...
# English: "Every good boy does fine."
# Gibberish: "Ithagev-rithagry githagood bithagoy dithagoes fithagine."


# Problem: Can't figure out how to parse syllables!!!



# RIP sweet one-liner puts input_text.split(" ").map{|word| word.insert(1, "ithag")}.join(' ')

def jibberish(input_text)

words = input_text.split(" ")


# Basic formatting
for word in words
  if word.length <= 3
  	word.insert(1, "ithag")
  elsif word[0,2] == "th"
  	word.insert(2, "ithag")
  else
	word.insert(1, "ithag")
end
end

translated_text = words.join(' ')

end

while true
  puts "Input text please:"
  input_text = gets.chomp
  if input_text == ''
    exit
  else
    puts "#{jibberish(input_text)}"
  end
end
