require_relative "../models/customer"
require_relative "../views/customer_view"

class CustomersController
  def initialize(customers_repository)
    @customers_view = CustomerView.new
    @customers_repository = customers_repository
  end

  def create
    customer_attributes = @customers_view.ask_for_customer_info
    customer = Customer.new(customer_attributes)
    @customers_repository.add(customer)
  end

  def list
    customers = @customers_repository.all
    @customers_view.display_customers(customers)
  end
end
