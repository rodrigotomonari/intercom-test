# frozen_string_literal: true

class InvalidCoordinateException < ArgumentError
end

class InvalidFileFormatException < ArgumentError
end

class InvalidFileNotFoundException < IOError
end
