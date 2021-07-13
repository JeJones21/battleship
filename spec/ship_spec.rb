require './lib/ship'

RSpec.describe Ship do
  it 'exitsts' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_an_instance(Ship)
  end
end
