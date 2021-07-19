require './lib/cell'
require 'pry'

class Board

  attr_reader :cells,
              :lets,
              :nums,
              :ship_length

  def initialize
    @cells = {}
    cell_setup
  end

  def cell_setup
    rows = ["A", "B", "C", "D"]
    columns = ["1", "2", "3", "4"]
    rows.each do |row|
      columns.each do |column|
        coordinates = row + column
        @cells[coordinates] = Cell.new(coordinates)
      end
    end
  end

  def valid_coordinate?(cell)
    @cells.key?(cell)
  end

  def valid_placement?(ship, coordinates)
    #first compare the length with overlapping/split and compare
    if scl(ship, coordinates) && overlapping?(coordinates)
      split_coords(coordinates)
       if finalize_that
          true
        else
          false
        end
    else
      false
    end
  end

  def scl(ship, coordinates)
    #scl stands for ship/coordinates/length
    ship.length == coordinates.length && @cells[coordinates]
    @ship_length = ship.length
  end

  def overlapping?(coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def split_coords(coordinates)
    #if split_coords doesn't work change the args to rows and columns
    letters = coordinates.map do |coordinate|
      coordinate.chars.first
    end
    numbers = coordinates.map do |coordinate|
      coordinate.chars.last
    end
    @lets = letters.map do |letter|
      letter.ord
    end
    @nums = numbers.map do |number|
      number.to_i
    end
  end

  def numbers_check
    (1..4).each_cons(@ship_length).include?(@nums) || @nums.uniq.count == 1
  end

  def letters_check
    (65..68).each_cons(@ship_length).include?(@lets) || @lets.uniq.count == 1
  end

  def diagonal?
    #find a way to compare lets && nums with the 2 ranges
    ((@lets.uniq.count == 1) && (@nums.uniq.count == 1)) || ((1..4).each_cons(@ship_length).include?(@nums) && (65..68).each_cons(@ship_length).include?(@lets))
  end

  def finalize_that
    #compare the letters nums and diagonal
    (letters_check && numbers_check) && (diagonal? == false)
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        (@cells[coordinate]).place_ship(ship)
      end
    end
  end

  def render(reveal = false)
    strings = "  1 2 3 4 \n"
    alphabet = ["A", "B", "C", "D"]
    numbers = ["1", "2", "3", "4"]
    alphabet.each do |letter|
      strings = strings + letter + " "
      numbers.each do |number|
        coordinate = letter + number
        strings = strings + @cells[coordinate].render(reveal) + " "
      end
      strings = strings + "\n"
    end
    return strings
  end
end
