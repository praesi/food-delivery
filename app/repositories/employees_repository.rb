require "csv"
class EmployeesRepository
  def initialize(csv_filepath)
    @csv_filepath = csv_filepath
    @employees = []
    load_from_csv
    @next_id = @employees.empty? ? 1 : @employees.last.id + 1
  end

  def all
    @employees
  end

  def find(id)
    @employees.find {|employee| employee.id == id}
  end

  private
  def load_from_csv
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_filepath, csv_options) do |row|
      id = row[:id].to_i
      username = row[:username]
      password = row[:password]
      position = row[:position]
      employee_attributes = {
        id: id,
        username: username,
        password: password,
        position: position
      }
      employee = Employee.new(employee_attributes)
      @employees << employee # CUSTOMER OBJECT!
    end
  end
end
