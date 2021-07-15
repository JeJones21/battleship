require './lib/ship'

class Cell

  attr_reader :coordinate,
              :ship,
              :fire

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fire = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fire
  end

  def fire_upon
    if empty? == false
      @ship.hit
      @fire = true
    else
      @fire = true
    end
  end

  def miss?
    fired_upon? && empty?
  end

  def ship_hit?
    @hit == true
  end

  def render(reveal = false)
    if fired_upon? && empty?
      "M"
    elsif fired_upon? && !empty? && !@ship.sunk?
      "H"
    elsif !empty? && fired_upon? && @ship.sunk?
      "X"
    elsif reveal == true && !empty?
      "S"
    else
      "."
    end
  end
end
