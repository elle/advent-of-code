class Ring
  def self.for(number)
    root = Math.sqrt(number).ceil
    if (number % 2).zero?
      root += 1
    end

    ((root + 1) / 2) - 1
  end

  attr_reader :level
  attr_reader :s, :sw, :w, :nw, :n, :ne, :e, :se

  def initialize(ring_level)
    @level = ring_level
    @s  = high_square - (1 * level)
    @sw = high_square - (2 * level)
    @w  = high_square - (3 * level)
    @nw = high_square - (4 * level)
    @n  = high_square - (5 * level)
    @ne = high_square - (6 * level)
    @e  = high_square - (7 * level)
    @se = high_square
  end

  def high_square
    level.downto(0).map { |l| 8 * l }.sum + 1
  end

  private

  def increment_size
    range / 4
  end

  def range
    high_square - previous_ring.high_square
  end

  def previous_ring
    new(level - 1)
  end

  def start_square
    previous_ring.high_square + 1
  end
end
