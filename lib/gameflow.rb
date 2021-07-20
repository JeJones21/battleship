require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'

class Gameflow

  attr_reader :board,
              :wizard,
              :cruiser,
              :submarine

  def initialize
    @board = Board.new
    player = Board.new
    @wizard = Computer.new(player)
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def start
    welcome_message
    @board.render
  end

  def welcome_message
    puts "⚓️ Welcome to BATTLESHIP ⚓️"
    puts "Enter 'p' to play. Enter 'q' to quit. Enter 'i' for instructions."
    answer = gets.chomp.downcase
    if answer == 'p'
      play
    elsif answer == 'q'
      quit
    elsif answer == 'i'
      instructions
    else
      invalid
      welcome_message
    end
  end

  def game_setup

  end

  def place_coordinates
    
  end

  def ship_placement

  end

  def invalid
    puts "Invalid entry."
  end

  def instructions
    puts "\n"
    puts "You and the computer both receive a board and two ships."
    puts "After you place your ships on the board..."
    puts "You'll both take turns firing shots."
    puts "A hit ship will reveal an 'H'"
    puts "A miss will reveal an 'M'"
    puts "The first player to sink all of the opponent's ships wins!"
    puts "Would you like to play or quit?"
    puts "\n"
    if answer == 'p'
      play
    elsif answer == 'q'
      quit
    elsif answer == 'i'
      instructions
    else
      invalid
      welcome_message
    end
  end

  def play
    puts "Great decision! My ships are in play!"
    puts "Are you to battle?"
    puts "Place your ships now."
    puts "Your cruiser is 3 hits long and submarine is 2 hits long."
    puts "Your board is a 4x4. (Rows: A - D, Columns: 1 - 4)"
    puts "\n"
    place_coordinates
  end

  def quit
    exit
  end
end
