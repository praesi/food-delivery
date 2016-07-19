class Employee
  attr_reader :user_name, :password
  attr_accessor :id, :delivery_orders
  def initialize(attributes = {})
    @job_description = attributes[:job_description]
    @user_name = attributes[:user_name]
    @password = attributes[:password]
    @delivery_orders = []
  end

  def add_order(order)
    @delivery_orders << order
  end
end
