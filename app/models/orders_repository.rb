require "csv"

class OrdersRepository
  def initialize(csv_filepath, customers_repository,employees_repository)
    @customers_repository = customers_repository
    @employees_repository = employees_repository
    @csv_filepath = csv_filepath
    @orders = []
    load_from_csv
    @next_id = @orders.last.nil? ? 1 : @orders.last.id + 1
  end

  def find(id)
      @orders.find { |order| order.id == id }
  end

  def add_order(order)
    order.id = @next_id
    @next_id += 1
    @orders << order
    save_to_csv
  end

  def all
    @orders
  end

  def undelivered_orders
    @orders.select { |order| order.delivered}
  end

  def assigned_orders(employee_id)
    @orders.select { |order| order.employee.id == employee_id  }
  end
end
