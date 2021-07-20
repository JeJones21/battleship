require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/gameflow'

RSpec.describe Gameflow do
  it "exists" do
    board = Board.new
    game = Gameflow.new
    wiz_board = Board.new
    wizard = Computer.new(board)

    expect(game).to be_a(Gameflow)
  end
end
