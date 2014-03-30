## Translation of the first "FizzBuzz" I ever wrote with help from Codecademy, in Python
# for (var i=1;i<=100;i++) {
# 	if(i%15===0){
# 	console.log("CracklePop");
# }
# else if(i%5===0){
# 	console.log("Pop");
# }
# else if(i%3===0){
# 	console.log("Crackle");
# }
# else {
# 	console.log(i);
# }
# }


## Translation from Python to Ruby, my intuitive reaction to the question
# for num in 1..100
#   if num%15==0 then
#     puts "CracklePop"
#   end
#   if num%5==0 then
#     puts "Pop"
#   end
#   if num%3==0 then
#     puts "Crackle"
#   end 
#   puts num
# end

## A more refined solution, attempting to be concise, to not repeat myself, but to remain easy to read
(1..100).map { |num| if (num%15==0) then puts "CracklePop" elsif (num%5==0) then puts "Pop" elsif (num%3==0) then puts "Crackle" else puts num end}
