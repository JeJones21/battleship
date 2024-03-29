require './lib/cell'
require './lib/ship'
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

  it "can compare ship length to the coordinate length" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.cell_setup

    expect(board.scl(cruiser, ["A1", "A2", "A3"])).to eq(3)
  end

  xit "can split the coordinates" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.cell_setup

    expect(board.split_coords("A1")).to eq()
  end

  it "can validate placement by consecutively" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.cell_setup

    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
  end

  it "can compare all of these methods" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.cell_setup

    expect(board.valid_placement?(cruiser, ["A1","A2", "A3"])).to eq(true)
    expect(board.finalize_that).to eq(true)
  end

  it "can place ship" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.cell_setup
    board.place(cruiser, ["A1", "A2", "A3"])

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)
    expect(cell_3.ship == cell_2.ship).to eq(true)
  end

  it "can check if it is overlapping" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.cell_setup
    board.place(cruiser, ["A1", "A2", "A3"])

    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
  end

  it "can check letters and numbers" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.cell_setup
    board.place(cruiser, ["A1", "A2", "A3"])

    expect(board.numbers_check).to eq(true)
    expect(board.letters_check).to eq(true)
  end

  it "can check if diagonal" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.cell_setup
    board.place(cruiser, ["A1", "A2", "A3"])

    expect(board.diagonal?).to eq(false)
  end

  it "can render a grid" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.cell_setup
    board.place(cruiser, ["A1", "A2", "A3"])

    expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
  end
end
