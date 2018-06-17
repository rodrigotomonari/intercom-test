# frozen_string_literal: true

# Add lib to $LOADPATH
$:.unshift File.dirname(__FILE__)

require "customer"
require "customer_collection"
require "customer_collection_builder"
require "customer_factory"
require "customer_output"
require "customer_reader_txt"
require "exceptions"
require "geo_location"
require "geo_math"
require "geo_math"

class Main
  def output_invite_customers(filename, latitude, longitude, distance)
    begin
      reader = CustomerReaderTxt.new(filename)

      customer_collection = CustomerCollectionBuilder.new(reader, CustomerFactory).build

      geo_location = GeoLocation.new(latitude, longitude)

      customer_collection.filter_within_distance!(geo_location, distance)

      customer_collection.sort!

      CustomerOutput.new(customer_collection).output
    rescue InvalidCoordinateException, InvalidFileFormatException, InvalidFileNotFoundException => e
      puts e.message
    end
  end
end
