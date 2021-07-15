class Cell

  attr_reader :coordinate,
              :ship,
              :fire,
              :reveal

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fire = false
    @reveal = false
  end

  def empty?
    if @ship == nil
      return true
    else
      return false
    end
  end

  def place_ship(ship)
    #when we place a ship our cell now contains a ship
    @ship = ship
  end

  def fired_upon?
    if @fire == true
      return true
    else
      return false
    end
  end

  def fire_upon
    if empty? == false
      @ship.hit
      @fire = true
    else
      @fire = true
    end
  end

end
