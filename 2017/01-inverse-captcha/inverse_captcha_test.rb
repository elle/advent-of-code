require "minitest/autorun"
require "minitest/pride"
require "./inverse_captcha"

describe InverseCaptcha do
  describe ".solve" do
    it "returns 0" do
      assert_equal 0, InverseCaptcha.solve(string: "1234", rule: :next)
    end

    it "returns 3" do
      assert_equal 3, InverseCaptcha.solve(string: "1122", rule: :next)
    end

    it "returns 4" do
      assert_equal 4, InverseCaptcha.solve(string: "1111", rule: :next)
    end

    it "returns 9" do
      assert_equal 9, InverseCaptcha.solve(string: "91212129", rule: :next)
    end

    it "returns 6" do
      assert_equal 6, InverseCaptcha.solve(string: "1212", rule: :further)
    end

    it "returns 0" do
      assert_equal 0, InverseCaptcha.solve(string: "1221", rule: :further)
    end

    it "returns 4" do
      assert_equal 4, InverseCaptcha.solve(string: "123425", rule: :further)
    end

    it "returns 12" do
      assert_equal 12, InverseCaptcha.solve(string: "123123", rule: :further)
    end

    it "returns 4" do
      assert_equal 4, InverseCaptcha.solve(string: "12131415", rule: :further)
    end
  end
end
