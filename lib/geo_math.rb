# frozen_string_literal: true

class GeoMath
  EARTH_RADIUS = 6371.0

  def self.distance(point1, point2)
    # convert degrees to radians
    point1 = point1.map { |degrees| to_radians(degrees) }
    point2 = point2.map { |degrees| to_radians(degrees) }

    # compute deltas
    delta_lat = point2[0] - point1[0]
    delta_lon = point2[1] - point1[1]

    # Haversine formula
    central_angle = 2 * Math.asin(Math.sqrt(Math.sin((delta_lat) / 2)**2 + Math.cos(point1[0]) * Math.cos(point2[0]) * Math.sin((delta_lon) / 2)**2))

    # arc length
    central_angle * EARTH_RADIUS
  end

  def self.to_radians(degrees)
    degrees * Math::PI / 180
  end
end
