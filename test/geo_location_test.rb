# frozen_string_literal: true

require "test_helper"
require "geo_location"
require "geo_math"

class GeoLocationTest < Minitest::Test
  def setup
    @latitude     = 53.339428
    @longitude    = -6.257664
    @geo_location = GeoLocation.new(@latitude, @longitude)
  end

  def test_latitude
    assert_equal @latitude, @geo_location.latitude
  end

  def test_longitude
    assert_equal @longitude, @geo_location.longitude
  end

  def test_to_coordinates
    assert_equal [@geo_location.latitude, @geo_location.longitude], @geo_location.to_coordinates
  end

  def test_implements_distance_from_interface
    assert_respond_to @geo_location, :distance_from
  end

  def test_distance_from
    GeoMath.stub :distance, 10 do
      assert_equal 10, @geo_location.distance_from(GeoLocation.new(0, 0))
    end
  end

  def test_latitude_arg_exception
    assert_raises do
      GeoLocation.new(100, @longitude)
    end
  end

  def test_longitude_arg_exception
    assert_raises do
      GeoLocation.new(@latitude, 190)
    end
  end
end
