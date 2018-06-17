# frozen_string_literal: true

class GeoLocation
  attr_accessor :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude  = latitude.to_f
    @longitude = longitude.to_f

    raise InvalidCoordinateException, "Invalid latitude #{@latitude}" if @latitude.abs >= 90
    raise InvalidCoordinateException, "Invalid longitude #{@latitude}" if @longitude.abs >= 180
  end

  def to_coordinates
    [latitude, longitude]
  end

  def distance_from(location)
    GeoMath.distance self.to_coordinates, location.to_coordinates
  end
end
