# frozen_string_literal: true

require "test_helper"
require "customer_collection_builder"

class CustomerCollectionBuilderTest < Minitest::Test
  def setup
    @customer_collection_builder = CustomerCollectionBuilder.new(StubReader.new, StubFactory)
  end

  def test_build
    collection = @customer_collection_builder.build
    assert_equal [1, 2], collection.customers
  end
end

class StubReader
  def rows
    [1, 2]
  end
end

class StubFactory
  def self.create(row)
    row
  end
end
