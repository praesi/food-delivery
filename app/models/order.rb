class Order
  attr_reader :customer, :meal
  attr_accessor :employee, :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @customer.orders_made << self

    @delivered = attributes[:delivered] || false
  end

  def assign_employee(employee)
    @employee = employee
    employee.orders_to_deliver << self
  end
end
