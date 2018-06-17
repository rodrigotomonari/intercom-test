# frozen_string_literal: true

require "test_helper"
require "customer_collection"
require "customer_factory"
require "customer_collection_builder"

class CustomerReaderStub
  def rows
    [{ id: 1, name: "Customer", latitute: 0, longitude: 0 }]
  end
end

class CustomerReaderTest < Minitest::Test
  def setup
    @customer_reader = CustomerReader.new(CustomerReaderStub.new, CustomerFactory, CustomerCollection)
  end

  # def test_read
  #   result = [CustomerFactory.create({ id: 1, name: "Customer", latitute: 0, longitude: 0 })]
  #
  #   puts @customer_reader.read.inspect
  #   assert_equal result, @customer_reader.read
  # end
end
