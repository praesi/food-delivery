class Order
  attr_reader :delivered, :employee
  attr_accessor :id
  def initialize(attributes{})
    @customer = attributes[:customer]
    @employee = nil
    @delivered = attributes[:delivered]
    @meal = ""
  end

  def delivered
    @delivered = true
  end
end
