require "csv"

class CustomersRepository
  # attr_reader :
  def initialize(csv_filepath)
    @csv_filepath = csv_filepath
    @customers = []
    load_from_csv
    @next_id = @customers.last.nil? ? 1 : @customers.last.id + 1
  end

  def find(id)
    @customers.find do |customer|
      customer.id == id
    end
  end

  def add(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_to_csv
  end

  private
  def save_to_csv
    CSV.open(@csv_filepath, "wb") do |csv|
      csv << ["id", "name", "address"]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_from_csv
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_filepath, csv_options) do |row|
      customer_attributes = {
        name: row[:name],
        address: row[:address]
      }
      customer = Customer.new(customer_attributes)
      customer.id = row[:id].to_i
      @customers << customer
    end
  end
end
