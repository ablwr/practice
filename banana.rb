## Banana fana fo fana
# Takes in a name and gives you a song!
# Banana!


def banana(name)

# For names that start with vowels
if name.downcase.start_with?('a','e','i','o','u')
  mod_name = name.downcase
# For names that begin with a 2-letter consonant cluster
elsif name.downcase.start_with?('bl', 'br', 'cl', 'cr', 'dr', 'fl', 'fr', 'gl', 'gr', 'pl', 'pr', 'sc', 'sk', 'sl', 'sm', 'sn', 'sp', 'st', 'sw', 'th', 'tr', 'ch')
  mod_name = name.slice(2..-1)
# For names that begin with a 3-letter consonant cluster
elsif name.downcase.start_with?('chr', 'thr', 'sch', 'scl', 'scr', 'shr', 'spl', 'spr', 'str', 'squ')
  mod_name = name.slice(3..-1)
# For all other names
else
  mod_name = name.downcase.slice(1..-1)
end

puts name.capitalize + ", " + name.capitalize + ", bo-" + (name.downcase.start_with?('b') ? mod_name.downcase.slice(0..-1) : "b"+mod_name) + " \r\n" + 
"Banana-fana fo-" + (name.downcase.start_with?('f') ? mod_name.downcase.slice(0..-1) : "f"+mod_name) + " \r\n" + 
"Fee-Fi-mo-" + (name.downcase.start_with?('m') ? mod_name.downcase.slice(0..-1) : "m"+mod_name) + " \r\n"  + 
name.upcase + "!"

end

puts "Give me a name:"
name = gets.chomp
puts banana(name)
