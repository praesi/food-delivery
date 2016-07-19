require_relative "app/models/customer"
require_relative "app/models/employee"
require_relative "app/models/order"


require_relative "app/repositories/customers_repository"
# require_relative "app/repositories/employees_repository"
require_relative "app/repositories/orders_repository"


# customers_csv_filepath = File.join(__dir__, "customers.csv")
# employees_csv_filepath = File.join(__dir__, "employees.csv")
# orders_csv_filepath    = File.join(__dir__, "orders.csv")

# customers_repo = CustomersRepository.new(customers_csv_filepath)
# employees_repo = EmployeesRepository.new(employees_csv_filepath)
# orders_repo    = OrdersRepository.new(orders_csv_filepath, customers_repo, employees_repo)


sadhia = Customer.new(name: "Sadhia", address: "Rocket Labs, CPH")
nicolas = Employee.new(job_description: "delivery guy", user_name: "feeeeeeeeear", password: "fear me")

order = Order.new(customer: sadhia, meal: "Burger good")

order.assign_employee(nicolas)

puts  "I am the employee assigned to the order: #{order.employee.user_name}"
nicolas.add_order(order)
p order.employee.delivery_orders.first.meal

# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#    $ ruby app.rb
