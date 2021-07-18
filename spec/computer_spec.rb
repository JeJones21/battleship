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
  end

end
