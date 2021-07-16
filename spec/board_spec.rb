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
end
