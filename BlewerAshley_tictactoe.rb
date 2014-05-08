# Here is a simple game of TicTacToe.
# The computer isn't very smart but knows how to cheat.

class TicTacToe

# Create a board
def initialize

# This doesn't seem to be necessary but keeping it in for when restructuring
@computer = 'O'
@player = 'X'

@board = {
    :b1 => " ",:b2 => " ",:b3 => " ",
    :b4 => " ",:b5 => " ",:b6 => " ",
    :b7 => " ",:b8 => " ",:b9 => " "
    }

end

# Create a printed board

def printed_board
puts "1: " + @board[:b1] + " | " + "2: " +  @board[:b2] + " | " + "3: " + @board[:b3] + " \r\n" +
    "___________________" + " \r\n" +
    "4: " + @board[:b4] + " | " + "5: " + @board[:b5] + " | " + "6: " + @board[:b6] + " \r\n" +
    "___________________" + " \r\n" +
    "7: " + @board[:b7] + " | " + "8: " + @board[:b8] + " | " + "9: " + @board[:b9] + " \r\n"
end

# Welcome
# Who goes first? Flip a coin / pick a random number.

def game_starter
puts "Welcome to Tic-Tac-Toe."
puts "The computer will decide who goes first. \r\n ____________"
if rand(1..2) == 1
	puts "You go first. You will be X."
	player_moves
else
	puts "Computer goes first. The computer is O."
	computer_moves
end
end

# Ask player for moves

def player_moves
find_winner
# A not-very-DRY solution but one that definitely works, hoping to refactor soon.
puts "Your move (pick a number):"
STDOUT.flush
  move = gets.chomp
  if move == "1" 
  	@board[:b1] = "X" unless @board[:b1] == "O"
  elsif move == "2" 
  	@board[:b2] = "X" unless @board[:b2] == "O"
  elsif move == "3"
  	@board[:b3] = "X" unless @board[:b3] == "O"
  elsif move == "4" 
  	@board[:b4] = "X" unless @board[:b4] == "O"
  elsif move == "5"
  	@board[:b5] = "X" unless @board[:b5] == "O"
  elsif move == "6" 
  	@board[:b6] = "X" unless @board[:b6] == "O"
  elsif move == "7"
  	@board[:b7] = "X" unless @board[:b7] == "O"
  elsif move == "8" 
  	@board[:b8] = "X" unless @board[:b8] == "O"
  elsif move == "9"
  	@board[:b9] = "X" unless @board[:b9] == "O" 
  elsif move == "exit"
  	game_over
  else
  	player_moves
  end
puts printed_board
computer_moves
end

# Computer moves
# This computer is dumb but does have the ability to overwrite moves.
def computer_moves
find_winner
@board[[:b1, :b2, :b3, :b4, :b5, :b6, :b7, :b8, :b9].sample] = 'O'
puts printed_board
player_moves
end

#Find winner
def find_winner
game_over = nil

# Again, not very DRY but other efforts were not working!

if (@board[:b1] == "X" && @board[:b2] == "X" && @board[:b3] == "X") \
	|| (@board[:b4] == "X" && @board[:b5] == "X" && @board[:b6] == "X") \
	|| (@board[:b7] == "X" && @board[:b8] == "X" && @board[:b9] == "X") \
	|| (@board[:b1] == "X" && @board[:b4] == "X" && @board[:b7] == "X") \
	|| (@board[:b2] == "X" && @board[:b5] == "X" && @board[:b8] == "X") \
	|| (@board[:b3] == "X" && @board[:b6] == "X" && @board[:b9] == "X") \
	|| (@board[:b1] == "X" && @board[:b5] == "X" && @board[:b9] == "X") \
	|| (@board[:b3] == "X" && @board[:b5] == "X" && @board[:b7] == "X")
		player_wins
		game_over = true
		quit
	elsif (@board[:b1] == "O" && @board[:b2] == "O" && @board[:b3] == "O") \
	|| (@board[:b4] == "O" && @board[:b5] == "O" && @board[:b6] == "O") \
	|| (@board[:b7] == "O" && @board[:b8] == "O" && @board[:b9] == "O") \
	|| (@board[:b1] == "O" && @board[:b4] == "O" && @board[:b7] == "O") \
	|| (@board[:b2] == "O" && @board[:b5] == "O" && @board[:b8] == "O") \
	|| (@board[:b3] == "O" && @board[:b6] == "O" && @board[:b9] == "O") \
	|| (@board[:b1] == "O" && @board[:b5] == "O" && @board[:b9] == "O") \
	|| (@board[:b3] == "O" && @board[:b5] == "O" && @board[:b7] == "O")
		computer_wins
		game_over = true
		quit
	elsif @board[:b1] != " " && @board[:b2] != " " && @board[:b3] != " " \
		&& @board[:b4] != " " && @board[:b5] != " " && @board[:b6] != " " \
		&& @board[:b7] != " " && @board[:b8] != " " && @board[:b9] != " "
		draw
		game_over = true
	else
	end


end


def game_over
end
# Computer wins
def computer_wins
	puts "Computer wins!"
	repeat
end
# Player wins
def player_wins
	puts "You win!"
	repeat
end
# Draw
def draw
	puts "Mutually Assured Destruction (WINNER: NONE)"
	repeat
end

# Play the game more than once?
def repeat
puts "Play again? (y, n)"
play_again = gets.chomp.downcase
  case play_again	 
  when "y"
  	initialize
  	 game_starter
  when "n"
  	quit
  else 
  	repeat
  end
end

# Escape plan
def quit
abort("Thanks for playing!")
end

end

# Starts the game automatically
game = TicTacToe.new()
game.game_starter



