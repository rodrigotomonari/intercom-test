# frozen_string_literal: true

require "test_helper"
require "main"

class MainTest < Minitest::Test
  def setup
    @main = Main.new

    @dublin_latitude  = 53.339428
    @dublin_longitude = -6.257664
    @distance         = 100
  end

  def test_output_invite_customers
    filename  = File.join("test", "fixtures", "small_list.txt")
    out, _err = capture_io do
      @main.output_invite_customers(filename, @dublin_latitude, @dublin_longitude, @distance)
    end

    assert_equal "1\tCustomer from Nass\n3\tCustomer from Dublin\n", out
  end
end
