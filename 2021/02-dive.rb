class Dive
  attr_reader :instructions

  def initialize
    @instructions = File
      .readlines("02-dive.txt")
      .map(&:chomp)
      .map(&:split)
      .map { |a, b| [a, b.to_i] }
    @horizontal_position = 0
    @depth = 0

    process
  end

  def process
    instructions.each do |command, distance|

      case command
      when "forward"
        @horizontal_position += distance
      when "up"
        @depth -= distance
      when "down"
        @depth += distance
      else
        raise "Unknown command"
      end
    end
  end

  def final_position
    @horizontal_position * @depth
  end
end

puts Dive.new.final_position
