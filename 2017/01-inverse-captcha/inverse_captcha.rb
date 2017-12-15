class InverseCaptcha
  def self.solve(string:, rule:)
    new(string: string, rule: rule).solve
  end

  def initialize(string:, rule:)
    @digits = string.chars.map(&:to_i)
    @rule = rule
  end

  def solve
    digits.select.with_index { |e, i| e == challenger(i + jump(i)) }.sum
  end

  private

  attr_reader :digits, :rule

  def challenger(index)
    digits[index] || digits[index - length]
  end

  def jump(current_index)
    if comparing_next?
      1
    else
      midppoint_index
    end
  end

  def midppoint_index
    length / 2
  end

  def length
    digits.length
  end

  def comparing_next?
    rule == :next
  end
end
