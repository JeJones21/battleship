require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  it "exists" do
    board = Board.new

    expect(board).to be_a(Board)
  end

  it "can setup board with cells" do
    board = Board.new

    board.cell_setup

    expect(board.cells.length).to eq(16)
  end

  it 'can validate coordinate' do
    board = Board.new

    board.cell_setup

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  it "can validate placement by length" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.cell_setup

    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end

#   it "can validate placement by consecutively" do
#     board = Board.new
#     cruiser = Ship.new("Cruiser", 3)
#     submarine = Ship.new("Submarine", 2)
#
#     board.cell_setup
#
#     expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
#     expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
#     expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
#     expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
#   end
#
#   it "can compare all of these bs methods" do
#     board = Board.new
#     cruiser = Ship.new("Cruiser", 3)
#     submarine = Ship.new("Submarine", 2)
#
#     board.cell_setup
#
#     expect(board.valid_placement?(cruiser, ["A1","A2", "A3"])).to eq(true)
#
#   end
#
#
#
#
#
#
#
# end
