class Gameflow

  attr_reader :board,
              :player,
              :wizard,
              :cruiser,
              :submarine

  def initialize
    @board = Board.new
    @player = Board.new
    @wizard = Computer.new(wiz_board)
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def start
    welcome_message
    instructions
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

  def ship_placement

  end

  def invalid
    puts "Invalid entry."
  end

  def instructions
    if condition

    end
  end

  def play
    # say to user, then place coordinates
  end

  def quit
    exit
  end
end
