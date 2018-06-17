# frozen_string_literal: true

class CustomerCollectionBuilder
  attr_accessor :reader, :factory

  def initialize(reader, factory)
    @reader  = reader
    @factory = factory
    @collection = CustomerCollection.new
  end

  def build
    rows.each do |row|
      @collection.push @factory.create(row)
    end

    @collection
  end

  private

    def rows
      reader.rows
    end
end
