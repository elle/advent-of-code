require "csv"

class CorruptionChecksum
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def checksum
    CSV.foreach(path).map do |row|
      Row.new(row).highest_differential
    end.sum
  end

  def divisables_sum
    CSV.foreach(path).map do |row|
      Row.new(row).divisables_sum
    end.sum
  end

  class Row
    attr_reader :items

    def initialize(array)
      @items = array.map(&:to_i).sort.reverse
    end

    def highest_differential
      items.max - items.min
    end

    def divisables_sum
      items.
        product(items).
        reject { |a, b| a == b || (a % b).nonzero? }.
        map { |a, b| a / b }.
        first
    end
  end
end
