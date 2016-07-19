class Employee
  attr_reader :user_name
  attr_accessor :id
  def initialize(attributes = {})
    @job_description = attributes[:job_description]
    @user_name = attributes[:user_name]
    @password = attributes[:password]
  end
end
