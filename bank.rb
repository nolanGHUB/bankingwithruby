require 'hirb'
require 'pp'
require 'colorize'

class Bank
  def initialize
    @customer_data = []
    @account_data = []
    customer_filler
    account_filler
  end

  def customer_filler
  customer_file = File.open(File.dirname(__FILE__) + '/data/customer.txt', 'r') do |line|
    line.each do |record|
      recordc = record.chomp
      @customer_data.append(recordc.split("_"))
    end
  end
  end

  def account_filler
  account_file = File.open(File.dirname(__FILE__) + '/data/account.txt', 'r') do |line|
    line.each do |record|
      recordc = record.chomp
      @account_data.append(recordc.split("_"))
    end
  end
  end
end

class Customer < Bank
  attr_accessor :customer_number, :first, :last, :social, :address

  # def initialize
  #   @customer_number
  #   @first
  #   @last
  #   @social
  #   @address
  # end
  @customer_data
  def create_customer(arr)
    @customer_number = arr[0]
    @first = arr[1]
    @last = arr[2]
    @social = arr[3]
    @address = arr[4]

    file = File.open(File.dirname(__FILE__) + "/data/customer.txt", "a") do |line|
      line.puts ""
      arr.each_with_index do |thing, index|
        if index === 4
          line.write "#{thing}".chomp
        elsif index === 0
          line.write "#{thing}_"
        else
          line.write "#{thing}_"
        end
      end
      line.puts ""
    end

    puts "Customer Created!".green
  end
  #
  def login_customer_data(customer_number)
    @customer_data.each_with_index do |line, index|
      #p line[0]
      if line[0] === customer_number.to_s
        @customer_number = line[0]
        @first = line[1]
        @last = line[2]
        @social = line[3]
        @address = line[4]
      end
    end
  end
end

class Account < Customer
  attr_accessor :account, :account_type, :balance, :last_accessed
  @account_array = []
  def set_account_data(customer_number, account_type)
    @account_data.each_with_index do |line, index|
      if line[0] === customer_number.to_s and line[2] === account_type
        @account = line[1]
        @account_type = line[2]
        @balance = line[3]
        @last_accessed = line[4]
      end
    end
  end
  #p @account_array
end

class Transaction < Account
  attr_accessor :transaction_number, :transaction_type, :amount, :time, :account_from, :account_to


  def new_transaction

  end

  def deposit(how_much)
    puts "Which account would you like to deposit to?".blue
    puts "(C)hecking".green
    puts "(S)avings".green
    account_type = gets.chomp.to_s
    if account_type === 'c'
      type = 'checking'
    elsif type === 's'
      type = 'savings'
    end
    set_account_data(@customer_number, type)
    @balance = (@balance.to_i) + (how_much.to_i)
  end

  def withdrawl(how_much)
    puts "Which account would you like to withdrawl from?".blue
    puts "(C)hecking".green
    puts "(S)avings".green
    account_type = gets.chomp.to_s
    if account_type === 'c'
      type = 'checking'
    elsif type === 's'
      type = 'savings'
    end
    set_account_data(@customer_number, type)
    @balance = (@balance.to_i) - (how_much.to_i)
    puts @balance
  end

  def transfer(from_account, to_account, how_much)

  end

  def new_customer
  end

  def interact
    #call banks get info from file functions here
    # @customer_data
    puts "Welcome to the bank, how may we help you?".blue
    puts "(c)reate new account".green
    puts "(l)ogin with customer number".green
    puts "(s)how all accounts".green
    puts "(r)ecords of transactions".green
    puts "(e)xit".red
    r1 = gets.chomp.to_s
    if r1.downcase === 'c'
      puts "Enter your first name".green
      f_name = gets.chomp.to_s
      puts "Enter your last name".green
      l_name = gets.chomp.to_s
      puts "Enter your SSN".green
      ssn = gets.chomp.to_s
      puts "Enter your Address".green
      address = gets.chomp.to_s

      len = @customer_data.length

      arr = [((len + 1).to_s), f_name, l_name, ssn, address]

      @customer_data.append(arr)
      create_customer(arr)
      puts "Account created!".yellow


    elsif r1.downcase === 'l'
      puts "Welcome back, enter customer number:".green
      temp_c_num = gets.chomp.to_s
      login_customer_data(temp_c_num)
      #do a check to see if temp_c_num exists in @customer_data if so then
      # parse customer_data and fill in @customer_number & @name & @social &@address such as @customer_number = whatever
      #also parse @account_data and fill in the appropriate account information
      #if successfully logged in
      puts "Welcome #{@first}!, what would you like to do today?".blue
      puts "See account (b)alances".green
      puts "Make a (w)ithdrawal".green
      puts "Make a (d)eposit".green
      puts "Make a (t)ransfer".green
      r2 = gets.chomp.to_s
      if r2.downcase === 'w'
          puts "Great, withdrawl how much?".blue
          how_much = gets.chomp.to_s
          withdrawl(how_much)
      elsif r2.downcase === 'b'
        puts "(C)hecking".green
        puts "(S)avings".green
        type = gets.chomp.to_s

        if type === 'c'
          type = 'checking'
        elsif type === 's'
          type = 'savings'
        end

        set_account_data(temp_c_num, type)

        puts "Your #{type} balance is $#{@balance}".blue
      elsif r2.downcase === 'd'
        #IF THEY HAVE BOTH CHECKING AND SAVINGS THEN ASK WHICH ONE THEY WANT TO WITHDRAW FROM
        # IF THEY ONLY HAVE ONE OR THE OTHER JUST JUMP TO
        puts "Great, deposit how much?".blue
        how_much = gets.chomp.to_s
        deposit(how_much)
      elsif r1.downcase === 't'
        puts "Transfer from?".blue
        # only puts this is they have a checking acc
        puts "(C)hecking".green
        # only puts this is they have a savings acc
        puts "(S)aving".green
        r3 = gets.chomp.to_s
        if r3.downcase === 'c'
          # functionality to transfer from checking
        elsif r3.downcase === 's'
          # functionality to transfer from savings
        end
        puts "Transfer to?"
        # conditionally display these below depending on what they chose above.
        puts "(C)hecking"
        puts "(S)aving"
        puts "(A)nother account"
        r4 = gets.chomp.to_s
        if r4.downcase === 'c'
          # functionality to transfer from "account" to checking
        elsif r4.downcase === 's'
          # functionality to transfer from "account" to savings
        elsif r4.downcase === "a"
          # functionality to transfer from "account" to another account
          puts "Amount to transfer?"
          r5 = gets.chomp.to_i
          # functionality to make the actual transfer
          puts "Success! We #{r5} transfered from #{acc} to #{secondacc}"
        end
      end
    elsif r1 === 'e'
      puts "Exiting!"
      #run some sort of cleanup and re-write all 3 files with new info
    elsif r1.downcase === 's'

      data = []

      file = File.open(File.dirname(__FILE__) + '/data/customer.txt', "r") do |line|

        line.each do |record|
          # puts record
          r = record.chomp
          data.append(r.split("_"))
        end
      end

      puts Hirb::Helpers::AutoTable.render(
          data,
          fields: [0, 1, 2, 3, 4],  #Specify the index positions in each row array to include in the table and their column order in the table
          headers: {0 => 'Account #', 1 => 'First Name', 2 => "Last Name", 3 => "SSN", 4 => "Address"},  #Convert the column headers to something more desirable
          description: false #Get rid of "3 rows in set" following the table
      )
    elsif r1.downcase === 'r'
      data = []

      file = File.open(File.dirname(__FILE__) + '/data/transaction.txt', "r") do |line|

        line.each do |record|
          # puts record
          r = record.chomp
          data.append(r.split("_"))
        end
      end

      puts Hirb::Helpers::AutoTable.render(
          data,
          fields: [0, 1, 2, 3, 4],  #Specify the index positions in each row array to include in the table and their column order in the table
          headers: {0 => 'Account #', 1 => 'Transaction #', 2 => "Type", 3 => "Amount", 4 => "Date/Time"},  #Convert the column headers to something more desirable
          description: false #Get rid of "3 rows in set" following the table
      )
    end


  end
end



#my_account = Account.new
#my_account.account = 500
#my_account.account_type = 'savings'

#newbank = Customer.new(gets.strip, gets.strip, gets.strip, gets.strip)
#
#newbank.cust_info
#
#puts newbank.push_to_db



#Bank
#
i = Transaction.new()
i.interact