# frozen_string_literal: true

class CustomerOutput
  attr_accessor :customers

  def initialize(customers)
    @customers = customers
  end

  def output
    customers.each do |customer|
      puts "#{customer.user_id}\t#{customer.name}"
    end
  end
end
