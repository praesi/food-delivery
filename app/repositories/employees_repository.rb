require "csv"

class EmployeesRepository

  def initialize(csv_filepath)
    @csv_filepath = csv_filepath
    @employees    = []
    load_from_cvs
  end

 def all
    @employees
  end



  def load_from_csv
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_filepath, csv_options) do |row|
      employee_attributes = {
        user_name: row[:name],
        password: row[:password]
        job_description: row[:job_description]
      }
      customer = Customer.new(customer_attributes)
      customer.id = row[:id].to_i
      @employees << employee
    end
  end

end
