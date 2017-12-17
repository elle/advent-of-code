require "minitest/autorun"
require "minitest/pride"
require "./spiral_memory"

describe SpiralMemory do
  describe "#steps" do
    it "retuns 0" do
      assert_equal 0, SpiralMemory.new(1).steps
    end

    it "returns 1" do
      assert_equal 1, SpiralMemory.new(2).steps
    end

    it "retuns 2" do
      assert_equal 2, SpiralMemory.new(23).steps
    end

    it "returns 371" do
      assert_equal 371, SpiralMemory.new(368078).steps
    end
  end
end
