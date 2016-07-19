class Order
  attr_reader :delivered, :employee, :meal
  attr_accessor :id

  def initialize(attributes = {})
    customer  = attributes[:customer]
    @customer = customer
    customer.customer_orders << self
    # TODO call method on customer to make it aware of this new order
    @delivered = attributes[:delivered] || false
    @meal = attributes[:meal]
  end

  def delivered
    @delivered = true
  end

  def assign_employee(employee)
    @employee = employee
    employee.delivery_orders << self
  end


end
