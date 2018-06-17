# frozen_string_literal: true

require "test_helper"
require "customer_factory"
require "customer"
require "geo_location"

class CustomerFactoryTest < Minitest::Test
  def test_create_with_symbols_keys
    customer = CustomerFactory.create(user_id: 1, name: "John Doe", latitude: 10, longitude: 20)

    assert_instance_of Customer, customer
    assert_equal 1, customer.user_id
    assert_equal "John Doe", customer.name

    assert_instance_of GeoLocation, customer.geo_location
    assert_equal 10, customer.geo_location.latitude
    assert_equal 20, customer.geo_location.longitude
  end

  def test_create_with_string_keys
    customer = CustomerFactory.create("user_id": 1, "name": "John Doe", "latitude": 10, "longitude": 20)

    assert_instance_of Customer, customer
    assert_equal 1, customer.user_id
    assert_equal "John Doe", customer.name

    assert_instance_of GeoLocation, customer.geo_location
    assert_equal 10, customer.geo_location.latitude
    assert_equal 20, customer.geo_location.longitude
  end

  def test_implements_the_factory_interface
    assert_respond_to CustomerFactory, :create
  end
end
