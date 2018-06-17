# frozen_string_literal: true

require "test_helper"
require "customer_reader_txt"
require "exceptions"

class CustomerTxtReaderTest < Minitest::Test
  def setup
    @customer_reader_txt = CustomerReaderTxt.new(File.join("test", "fixtures", "customers.txt"))
  end

  def test_implements_the_reader_interface
    assert_respond_to @customer_reader_txt, :rows
  end

  def test_rows_return_customers_array
    assert_kind_of Array, @customer_reader_txt.rows
    assert_equal 32, @customer_reader_txt.rows.size
  end

  def test_invalid_json_exception
    @customer_reader_txt = CustomerReaderTxt.new(File.join("test", "fixtures", "invalid_json_format.txt"))

    assert_raises do
      @customer_reader_txt.rows
    end
  end

  def test_missing_fields_exception
    @customer_reader_txt = CustomerReaderTxt.new(File.join("test", "fixtures", "error_list.txt"))

    assert_raises do
      @customer_reader_txt.rows
    end
  end

  def test_line_error_index
    @customer_reader_txt = CustomerReaderTxt.new(File.join("test", "fixtures", "invalid_json_format.txt"))

    exception = assert_raises InvalidFileFormatException do
      @customer_reader_txt.rows.inspect
    end

    expected_msg = "Invalid JSON format in the file test/fixtures/invalid_json_format.txt. Please check the line 2."

    assert_equal expected_msg, exception.message
  end
end
