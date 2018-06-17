# frozen_string_literal: true

require "test_helper"
require "geo_math"

class GeoMathTest < Minitest::Test
  def test_distance
    assert_equal 111, GeoMath.distance([0, 0], [0, 1]).round
    assert_equal 111, GeoMath.distance([0, 0], [1, 0]).round

    assert_equal 111, GeoMath.distance([1, 0], [0, 0]).round
    assert_equal 111, GeoMath.distance([0, 1], [0, 0]).round

    dublin_to_london = GeoMath.distance([53.339428, -6.257664], [51.50299, -0.11396])
    assert_in_delta 463.7, dublin_to_london, 0.5
  end

  def test_to_radians
    assert_equal Math::PI, GeoMath.to_radians(180)
    assert_equal Math::PI / 2, GeoMath.to_radians(90)
    assert_equal 0, GeoMath.to_radians(0)
  end
end
