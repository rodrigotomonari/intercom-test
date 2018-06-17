# frozen_string_literal: true

require "test_helper"
require "customer_output"

class CustomerOutputTest < Minitest::Test
  def setup
    @customers = [
      Customer.new(user_id: 1, name: "Customer 1"),
      Customer.new(user_id: 2, name: "Customer 2"),
    ]

    @customer_output = CustomerOutput.new(@customers)
  end

  # Fake test
  def test_output
    out, _err = capture_io do
      @customer_output.output
    end

    assert_equal "1\tCustomer 1\n2\tCustomer 2\n", out
  end
end
