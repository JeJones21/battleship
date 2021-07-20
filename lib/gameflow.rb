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
    ready_to_play
    display_current_computer_board
    display_current_player_board
    fire_missle
  end

  def welcome_message
    puts "⚓️ Welcome to BATTLESHIP ⚓️"
    puts "Enter 'p' to play. Enter 'q' to quit. Enter 'i' for instructions."
    @player_input = input.downcase
    if @player_input == 'p'
      play
    elsif @player_input == 'q'
      quit
    elsif @player_input == 'i'
      instructions
    else
      invalid
      welcome_message
    end
  end

  def input
    gets.chomp
  end

  def place_coordinates

    @wizard.comp_place(@wizard.cruise_ship)
    @wizard.comp_place(@wizard.sub)

    puts "These are the rules for ship placement!"
    puts "****************************************"
    puts "Ships can be horizontal or vertical."
    puts "However, they cannot be overlapping or diagonal."
    puts "Coordinates need to be consecutive without skipping (Ex: 'A1 A2 A3')"
    puts "Include one space between each coordinate."
    puts "****************************************"
    puts "\nNow enter 3 coordinates for your cruiser"
    puts @board.render(true)

    @player_input = input.upcase.split
    board.valid_placement?(cruiser, @player_input)

    while !board.valid_placement?(cruiser, @player_input)
      puts "The coordinates #{@player_input} are not valid.\n"
      puts "Enter 3 coordinates for your cruiser."
      @player_input = input.upcase.split
    end

    board.place(cruiser, @player_input)
    puts "\n"
    puts @board.render(true)

    puts "\nNow enter 2 coordinates for your submarine"
    @player_input = input.upcase.split
    board.valid_placement?(submarine, @player_input)

    while !board.valid_placement?(submarine, @player_input)
      puts "The coordinates #{@player_input} are not valid.\n"
      puts "Enter 2 coordinates for your submarine."
      @player_input = input.upcase.split
    end

    board.place(submarine, @player_input)
    puts "\n"
    puts @board.render(true)
  end

  def ship_placement

  end

  def invalid
    puts "Invalid entry."
  end

  def instructions
    puts "\nYou and the computer both receive a board and two ships."
    puts "After you place your ships on the board..."
    puts "You'll both take turns firing shots."
    puts "A hit ship will reveal an 'H'"
    puts "A miss will reveal an 'M'"
    puts "The first player to sink all of the opponent's ships wins!"
    puts "Would you like to play or quit?"
    puts "\n"
    if @player_input == 'p'
      play
    elsif @player_input == 'q'
      quit
    elsif @player_input == 'i'
      instructions
    else
      invalid
      welcome_message
    end
  end

  def play
    puts "\nGreat decision! My ships are in play!"
    puts "Are you ready to battle?"
    puts "Place your ships now."
    puts "\nYour cruiser is 3 hits long and submarine is 2 hits long."
    puts "Your board is a 4x4. (Rows: A - D, Columns: 1 - 4)\n"
    place_coordinates
  end

  def quit
    exit
  end






  # Once the computer and player ships are placed, let the player know play begins
  def ready_to_play
    puts "\nIt looks like you're all set!"
    puts "Now get ready, because you get to fire first."
  end

  def take_turn
    # 1. Displaying the boards
      # 1a. Display computer board (reveal: false)
      # 1b. Display player board (reveal: true)
    # 2. Player choosing a coordinate to fire on
      # 2a. Check if user coordinate entered is valid
    # 3. Computer choosing a coordinate to fire on
    # 4. Reporting the result of the Player’s shot
    # 5. Reporting the result of the Computer’s shot

    # All of these are currently being called in 'start' but will be called in take_turn
    # display_current_computer_board
    # display_current_player_board
    # fire_missle

  end

  def display_current_computer_board
    puts "\n=============COMPUTER BOARD=============\n"
    puts @wizard.wiz_board.render
  end

  def display_current_player_board
    puts "\n=============PLAYER BOARD=============\n"
    puts @board.render(true)
  end

  def fire_missle
    puts "\nEnter the coordinate for your shot:"
    @player_input = input.upcase
    puts "\nNext is the firing upon the computer board."
    @wizard.wiz_board.fire_on_this_coordinate(@player_input)
  end
end
