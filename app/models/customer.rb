class Customer
  attr_accessor :customer_orders
  def initialize(attributes = {})
    @name     = attributes[:name]
    @address  = attributes[:address]
    @customer_orders   = []
  end

end


