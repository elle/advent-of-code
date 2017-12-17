require "minitest/autorun"
require "minitest/pride"
require "./ring"

describe Ring do
  describe ".for" do
    it "retruns level 0" do
      assert_equal 0, Ring.for(1)
    end

    it "returns level 1" do
      assert_equal 1, Ring.for(2)
    end

    it "returns level 1" do
      assert_equal 1, Ring.for(9)
    end

    it "returns level 2" do
      assert_equal 2, Ring.for(10)
    end

    it "returns level 2" do
      assert_equal 2, Ring.for(25)
    end

    it "returns level 3" do
      assert_equal 3, Ring.for(26)
    end

    it "returns 303" do
      assert_equal 303, Ring.for(368078)
    end
  end

  describe "#high_square" do
    it "returns 9" do
      ring = Ring.new(1)

      assert_equal 9, ring.high_square
    end

    it "returns 25" do
      ring = Ring.new(2)

      assert_equal 25, ring.high_square
    end
  end
end
