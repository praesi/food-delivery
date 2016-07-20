require_relative "../models/order"
require_relative "../views/order_view"

class OrdersController
  def initialize(orders_repository, customers_repository, employees_repository)
    @orders_repository = orders_repository
    @customers_repository = customers_repository
    @employees_repository = employees_repository
    @order_view = OrderView.new
  end


  def create_order
    meal = @order_view.ask_for_meal
    order_attributes = { meal: meal }

    customer_id = @order_view.ask_for_customer_id
    customer = @customers_repository.find(customer_id)

    order_attributes[:customer] = customer
    order = Order.new(order_attributes)

    # Ask user for employee_id
    employee_id = @order_view.ask_for_employee_id
    employee = @employees_repository.find(employee_id)

    # Get the employee from employees_repository

    order.assign_employee(employee)
    @orders_repository.add(order)
  end

  # def assign_employee(employee)
  #   # @employee = employee
  #   # employee.delvery_orders << self
  #   @order_view.list_all_orders(orders)
  # end

  def get_employee_orders
    employee_id = @order_view.ask_for_employee_id_order
    current_employee = @employees_repository.find(employee_id)
    orders = @orders_repository.all.select { |order| order.employee.id == employee_id }
    @order_view.list_orders(orders, current_employee)
  end



  def undelivered_orders
    orders = @orders_repository.all_undelivered_orders
    @order_view.list_undelivered_order(orders)
  end
end
