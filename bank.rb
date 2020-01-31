
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

class Bank
  @@customer_data = []
  @@account_data = []
  customer_file = File.open(File.dirname(__FILE__) + '/data/customer.txt', 'r') do |line|
    line.each do |record|
      recordc = record.chomp
      @@customer_data.append(recordc.split("_"))
    end
  end
  account_file = File.open(File.dirname(__FILE__) + '/data/account.txt', 'r') do |line|
    line.each do |record|
      recordc = record.chomp
      @@account_data.append(recordc.split("_"))
    end
  end
  p @@customer_data
  p @@account_data
end

Bank

