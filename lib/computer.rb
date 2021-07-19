class Computer

  attr_reader   :wiz_board,
                :ships,
                :cruise_ship,
                :sub


  def initialize(wiz_board)
    @wiz_board = wiz_board
    @cruise_ship = Ship.new("Cruiser", 3)
    @sub = Ship.new("Submarine", 2)
    @ships = []
  end

  def add_ships(ship)
    @ships << ship
  end

  def comp_coords(ship, length)
    coordinates = []
    until @wiz_board.valid_placement?(ship, coordinates)
      comp_coordinates = @wiz_board.cells.keys.sample(length)
      coordinates = comp_coordinates
    end
    coordinates
  end

  def comp_place(ship)
    coordinates = comp_coords(ship, ship.length)
    @wiz_board.place(ship, coordinates)
  end
end
