class Customer
  attr_accessor :customer_number, :name, :social, :address
  def initialize(customer_number, name, social, address)
    @customer_number = customer_number
    @name = name
    @social = social
    @address = address
    @cust_info = []
  end
  def cust_info
    puts "#{@customer_number}, #{@name}, #{@social}, #{@address}"
  end
  def push_to_db
    @cust_info << [@customer_number, @name, @social, @address]
  end
end

newbank = Customer.new(gets.strip, gets.strip, gets.strip, gets.strip)

newbank.cust_info

puts newbank.push_to_db