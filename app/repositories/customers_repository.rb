require "csv"
class CustomersRepository
  def initialize(csv_filepath)
    @csv_filepath = csv_filepath
    @customers = []
    load_from_csv
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def add(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_to_csv
  end

  def find(id)
    @customers.find {|customer| customer.id == id}
  end

  def all
    @customers
  end

  private
  def load_from_csv
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_filepath, csv_options) do |row|
      id = row[:id].to_i
      name = row[:name]
      address = row[:address]
      customer_attributes = {
        id: id,
        name: name,
        address: address
      }
      customer = Customer.new(customer_attributes)
      @customers << customer # CUSTOMER OBJECT!
    end
  end

  def save_to_csv
    CSV.open(@csv_filepath, "wb") do |csv|
      csv << ["id", "name", "address"]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
