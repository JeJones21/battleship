require './lib/cell'

class Board

  attr_reader :cells

  def initialize
    @cells = {}
    cell_setup
  end

  def cell_setup
    rows = ["A", "B", "C", "D"]
    columns = ["1", "2", "3", "4"]
    rows.each do |letter|
      columns.each do |number|
        coordinates = letter + number
        @cells[coordinates] = Cell.new(coordinates)
      end
    end
  end

  def valid_coordinate?(cell)
    @cells.key?(cell)
  end

  def valid_placement?(ship, coordinates)
    ship.length == coordinates.count
  end
end
