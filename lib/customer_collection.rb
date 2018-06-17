# frozen_string_literal: true

class CustomerCollection
  include Enumerable

  attr_accessor :customers

  def initialize(*customers)
    @customers = customers
  end

  def each(&block)
    customers.each(&block)
  end

  def push(customer)
    customers.push customer
  end

  def filter_within_distance!(geo_location, distance)
    customers.select! do |customer|
      customer.distance_from(geo_location) <= distance
    end
  end

  def sort!
    customers.sort_by!(&:user_id)
  end
end
