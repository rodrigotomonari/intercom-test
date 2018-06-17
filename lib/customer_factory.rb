# frozen_string_literal: true

class CustomerFactory
  def self.create(hash)
    hash = symbolize_keys(hash)
    Customer.new(
      user_id:      hash[:user_id],
      name:         hash[:name],
      geo_location: GeoLocation.new(hash[:latitude], hash[:longitude])
    )
  end

  class << self
    def symbolize_keys(hash)
      Hash[hash.map { |k, v| [k.to_sym, v] }]
    end
  end
end
