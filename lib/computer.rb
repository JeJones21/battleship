class Computer

  attr_reader :comp_board,
              :ships,
              :cruise_ship,
              :sub

  def initialize(comp_board)
    @comp_board = comp_board
    @cruise_ship = Ship.new("Cruiser", 3)
    @sub = Ship.new("Submarine", 2)
    @ships = []
  end

  def add_ships(ship)
    @ships << ship
  end

  def random_placement

  end
end
