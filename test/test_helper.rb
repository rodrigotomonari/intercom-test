# frozen_string_literal: true

begin
  require "simplecov"
  SimpleCov.start do
    add_filter "/test/"
  end
rescue LoadError
  # Continue without simplecov
end

require "minitest/autorun"
