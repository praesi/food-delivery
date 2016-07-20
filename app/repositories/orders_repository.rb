require "csv"

class OrdersRepository
  def initialize(csv_filepath, customers_repository, employees_repository)
    @customers_repository = customers_repository
    @employees_repository = employees_repository
    @csv_filepath = csv_filepath
    @orders = []
    load_from_csv
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end

  def add(order)
    order.id = @next_id
    @next_id += 1
    @orders << order
    save_to_csv
  end

  def all
    @orders
  end

  def all_undelivered_orders
    @orders.reject { |order| order.delivered }
  end

  def assigned_orders(employee_id)
    @orders.select { |order| order.employee.id == employee_id }
  end

  private
  def load_from_csv
    csv_options = {  headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_filepath, csv_options) do |row|
      id = row[:id].to_i
      meal = row[:meal]
      customer_id = row[:customer_id].to_i
      employee_id = row[:employee_id].to_i

      customer = @customers_repository.find(customer_id)
      employee = @employees_repository.find(employee_id)

      order = Order.new(id: id, meal: meal, customer: customer)
      order.assign_employee(employee)
      @orders << order
    end
  end

  def save_to_csv
    CSV.open(@csv_filepath, "wb") do |csv|
      csv << ["id", "meal", "customer_id", "employee_id"]
      @orders.each do |order|
        csv << [order.id, order.meal, order.customer.id, order.employee.id]
      end
    end
  end
end
