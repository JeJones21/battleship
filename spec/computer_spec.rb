require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/gameflow'
require './lib/computer'

RSpec.describe Computer do
  it "exists" do
    wiz_board = Board.new
    wizard = Computer.new(wiz_board)

    expect(wizard).to be_a(Computer)
    expect(wiz_board).to be_a(Board)
  end

  it "can add ships" do
    wiz_board = Board.new
    wizard = Computer.new(wiz_board)
    cruise_ship = Ship.new("Cruiser", 3)
    sub = Ship.new("Submarine", 2)

    wizard.add_ships(cruise_ship)
    wizard.add_ships(sub)

    expect(wizard.ships).to eq([cruise_ship, sub])
  end
end
