class Sonar
  attr_reader :numbers

  def initialize
    @numbers = File.readlines("01-sonar.txt")
      .map(&:chomp)
      .map(&:to_i)
      .each_cons(3)
      .map(&:sum)
  end

  def increased
    numbers.select.with_index do |n, i|
      if n > lines[i-1]
        n
      end
    end
  end
end
