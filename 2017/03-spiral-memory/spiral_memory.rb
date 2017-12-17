require "byebug"
require "matrix"

class SpiralMemory
  attr_reader :step_count, :square, :x, :y

  def initialize(square, step_count = 0)
    @square = square
    @x, @y = matrix.index(square)
    @step_count = step_count
  end

  def steps
    x.abs + y.abs
  end

  def matrix
    @matrix ||= Matrix[*build_matrix]
  end

  def build_matrix
    n = Math.sqrt(square).ceil
    m = Array.new(n){ Array.new(n) }
    position = n * n + 1
    side = n
    for i in 0 .. (n-1)/2
      (0...side).each{ |j| m[i][i+j]     = (position -= 1) }
      (1...side).each{ |j| m[i+j][n-1-i] = (position -= 1) }
      side -= 2
      side.downto(0) { |j| m[n-1-i][i+j] = (position -= 1) }
      side.downto(1) { |j| m[i+j][i]     = (position -= 1) }
    end
    m
  end

  def step
    if square < 2
      return step_count
    end

    new_square = right_degree_neighbours.min
    SpiralMemory.new(new_square, step_count + 1).step
  end

  def right_degree_neighbours
    [
      matrix[x, y-1],
      matrix[x, y+1],
      matrix[x-1, y],
      matrix[x+1, y],
    ].compact
  end
end
