# frozen_string_literal: true

require "json"

class CustomerReaderTxt
  attr_accessor :filename

  def initialize(filename)
    @filename = filename
  end

  def rows
    @index = 0
    File.open(filename).map do |line|
      @index = +1
      json   = convert_to_json(line)

      check_fields(json)

      json
    end
  end

  private

    def convert_to_json(string)
      JSON.parse string
    rescue Exception => _e
      raise InvalidFileFormatException, "Invalid JSON format in the file #{filename}. Please check the line #{@index}."
    end

    def check_fields(json)
      required_fields = %w(user_id name latitude longitude).sort
      msg             = "Customer at line #{@index} does not have all required fields."

      raise InvalidFileFormatException, msg unless json.keys.sort == required_fields
    end
end
