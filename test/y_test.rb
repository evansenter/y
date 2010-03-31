require "test_helper"
require "Y"

class YTest < ActiveSupport::TestCase
  test "combinator with explicit call" do
    assert_equal 120, Y(5) { |recurser, value| value.zero? ? 1 : value * recurser[value - 1] }
  end
  
  test "combinator when returning function" do
    factorial = Y { |recurser, value| value.zero? ? 1 : value * recurser[value - 1] }
    assert_equal 120, factorial[5]
  end
end