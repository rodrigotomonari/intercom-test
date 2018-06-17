# frozen_string_literal: true

require "test_helper"
require "customer"

class CustomerTest < Minitest::Test
  def test_distance_from
    stub_geo_location = StubGeoLocation.new
    customer = Customer.new(user_id: 1, name: "John Doe", geo_location: stub_geo_location)

    assert_equal 10, customer.distance_from(10)
  end
end

class StubGeoLocation
  def distance_from(_geo_location)
    10
  end
end
