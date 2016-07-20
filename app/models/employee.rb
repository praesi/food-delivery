class Employee
  attr_reader :username, :password, :id, :orders_to_deliver
  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @position = attributes[:position]
    @orders_to_deliver = []
  end
end
