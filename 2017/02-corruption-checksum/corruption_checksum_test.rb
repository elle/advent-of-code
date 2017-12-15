require "minitest/autorun"
require "minitest/pride"
require "./corruption_checksum"

describe CorruptionChecksum do
  describe "#checksum" do
    it "returns 18" do
      assert_equal 18, CorruptionChecksum.new("part1.csv").checksum
    end

    it "retuns 53460" do
      assert_equal 53460, CorruptionChecksum.new("input.csv").checksum
    end
  end

  describe "#divisables_sum" do
    it "returns 9" do
      assert_equal 9, CorruptionChecksum.new("part2.csv").divisables_sum
    end

    it "returns 9" do
      assert_equal 282, CorruptionChecksum.new("input.csv").divisables_sum
    end
  end
end
