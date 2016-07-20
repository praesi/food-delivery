
class OrderView


  def list_undelivered_order(orders)
    puts "Here is the list of undelivered orders #{orders}"
  end

  def ask_for_employee_id_order
    puts "What employee id do you want to look at?"
    employee_id = gets.chomp.to_i
  end

  def list_orders(orders, employee)
    puts "Here is the list of #{employee.username}'s orders"
    puts "-" * 20
    orders.each_with_index do |order, index|
      puts "#{index + 1} - #{order.meal}."
      puts "Deliver to: #{order.customer.address}"
      puts "*" * 15
    end
  end

  def ask_for_meal
    puts "What meal do you want?"
    gets.chomp
  end

  def ask_for_customer_id
    puts "What is the customers id for which the meal you just ordered should go to?"
    gets.chomp.to_i
  end

  def ask_for_employee_id
    puts "Who is gonna deliver it? Put in the employee id."
    gets.chomp.to_i
  end

end
