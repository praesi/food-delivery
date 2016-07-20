class Customer
  attr_reader :name, :address, :orders_made
  attr_accessor :id
  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
    @orders_made = []
  end
end


