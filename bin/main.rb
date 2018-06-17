#!/usr/bin/ruby
# frozen_string_literal: true

require_relative "../lib/main"

filename = ARGV.shift || "customers.txt"
dublin_latitude = 53.339428
dublin_longitude = -6.257664

Main.new.output_invite_customers(filename, dublin_latitude, dublin_longitude, 100)
