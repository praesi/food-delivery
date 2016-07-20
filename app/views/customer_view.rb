class CustomerView

  def ask_for_customer_info
    customer_attributes = {}
    puts "What is the customers name?"
    customer_attributes[:name] = gets.chomp
    puts "What is the address?"
    customer_attributes[:address] = gets.chomp
    return customer_attributes
  end

  def display_customers(customers)
    puts "here are all the #{customers}"
  end
end
