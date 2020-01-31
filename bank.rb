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