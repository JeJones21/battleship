class Gameflow

  attr_reader

  def initialize

  end

  def start
    welcome_message
    instructions
    play_or_exit
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

  def play_or_exit
    # after a player's won, ask to play again
  end
end
