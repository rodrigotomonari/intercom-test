# frozen_string_literal: true

require "test_helper"
require "geo_location"
require "customer"
require "customer_collection"

class CustomerCollectionTest < Minitest::Test
  def setup
    @dublin_location = GeoLocation.new(53.339428, -6.257664)
    @nass_location   = GeoLocation.new(53.2201813, -6.6941594) # ~32 KM from Dublin
    @london_location = GeoLocation.new(51.50299, -0.11396) # ~463 KM from Dublin

    customers = [
      Customer.new(user_id: 3, name: "Customer 3", geo_location: @dublin_location),
      Customer.new(user_id: 1, name: "Customer 1", geo_location: @nass_location),
      Customer.new(user_id: 2, name: "Customer 2", geo_location: @london_location)
    ]

    @customer_collection = CustomerCollection.new(*customers)
  end

  def test_push
    @customer_collection.push(Customer.new(user_id: 4, name: "Customer 4", geo_location: @dublin_location))

    assert_equal 4, @customer_collection.count
  end

  def test_filter_within_distance!
    @customer_collection.filter_within_distance!(@dublin_location, 100)

    assert_equal [3, 1], @customer_collection.map(&:user_id)
  end

  def test_sort!
    @customer_collection.sort!

    assert_equal [1, 2, 3], @customer_collection.map(&:user_id)
  end
end
