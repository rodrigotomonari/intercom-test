# frozen_string_literal: true

class Customer
  attr_accessor :user_id, :name, :geo_location

  def initialize(args)
    @user_id      = args[:user_id]
    @name         = args[:name]
    @geo_location = args[:geo_location]
  end

  def distance_from(location)
    geo_location.distance_from(location)
  end
end
