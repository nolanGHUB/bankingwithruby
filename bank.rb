class Bank
  @customer_data = []
  @account_data = []

  def get_customer_data
    customer_file = File.open(File.dirname(__FILE__) + '/data/customer.txt', 'r') do |line|
      line.each do |record|
        recordc = record.chomp
        @customer_data.append(recordc.split("_"))
      end
    end
  end

  def get_account_data
    account_file = File.open(File.dirname(__FILE__) + '/data/account.txt', 'r') do |line|
      line.each do |record|
        recordc = record.chomp
        @account_data.append(recordc.split("_"))
      end
    end
  end

  def print_data
    p @customer_data
    p @account_data
  end

end

class Customer < Bank
  attr_accessor :customer_number, :name, :social, :address
  #def initialize(customer_number, name, social, address)
  #  @customer_number = customer_number
  #  @name = name
  #  @social = social
  #  @address = address
  #  @cust_info = []
  #end
  def cust_info
    puts "#{@customer_number}, #{@name}, #{@social}, #{@address}"
  end
  def push_to_db
    @cust_info << [@customer_number, @name, @social, @address]
  end
end

class Account < Customer
  attr_accessor :account, :account_type, :balance, :last_accessed
  @account_array = []
  def create_array
    @account_array << [@customer_number, @account, @account_type, @balance, @last_accessed]
  end
  #p @account_array
end

class Transaction < Account
  attr_accessor :transaction_number, :transaction_type, :amount, :time, :account_from, :account_to


  def new_transaction

  end

  def deposit(to_account, how_much)

  end

  def withdraw(from_account, how_much)

  end

  def transfer(from_account, to_account, how_much)

  end

  def new_customer
  end

  def interact
    #call banks get info from file functions here
    get_customer_data
    get_account_data

    puts "Welcome to the bank, how may we help you?"
    puts "(c)reate new account"
    puts "(l)ogin with customer number"
    puts "(e)xit"
    r1 = gets.chomp.to_s
    if r1.downcase === 'c'
      #create account here and then loop back around to interact again
    elsif r1.downcase === 'l'
      puts "Welcome back, enter customer number:"
      temp_c_num = gets.chomp.to_s
      #do a check to see if temp_c_num exists in @customer_data if so then
      # parse customer_data and fill in @customer_number & @name & @social &@address such as @customer_number = whatever
      #also parse @account_data and fill in the appropriate account information
      #if successfully logged in
      puts "Welcome #{@name}!, what would you like to do today?"
      puts "Make a (w)ithdrawal"
      puts "Make a (d)eposit"
      puts "Make a (t)ransfer"
      r2 = gets.chomp.to_s
      if r2.downcase === 'w'
        if @account_type === 'cs'
          puts "Okay, which account do you want to withdraw from?"
          puts "(c)hecking"
          puts "(s)avings"
          which_account = gets.chomp.to_s
          if which_account === 'c'
            puts "Great, withdraw how much?"
            how_much = gets.chomp.to_s
            withdraw(@checking_number, how_much)
            interact
          elsif which_account === 's'
            puts "Great, withdraw how much?"
            how_much = gets.chomp.to_s
            withdraw(@savings_number, how_much)
            interact
          end
        elsif @account_type === 'c'
          puts "Great, withdraw how much?"
          how_much = gets.chomp.to_s
          withdraw(@checking_number, how_much)
          interact
        elsif @account_type === 's'
          puts "Great, withdraw how much?"
          how_much = gets.chomp.to_s
          withdraw(@savings_number, how_much)
          interact
        end
        #if unsucessfully logged in
        puts "customer number does not exist"
        #interact
      elsif r1.downcase === 'd'
        #IF THEY HAVE BOTH CHECKING AND SAVINGS THEN ASK WHICH ONE THEY WANT TO WITHDRAW FROM
        # IF THEY ONLY HAVE ONE OR THE OTHER JUST JUMP TO
        puts "Great, deposit how much?"
        how_much = gets.chomp.to_s
        deposit(to_where, how_much)
        interact
      elsif r1.downcase === 't'
        puts "Transfer from?"
        # only puts this is they have a checking acc
        puts "(C)hecking"
        # only puts this is they have a savings acc
        puts "(S)aving"
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
    end
  end
end

my_transition = Transaction.new
my_transition.get_customer_data
my_transition.get_account_data
my_transition.print_data


#my_account = Account.new
#my_account.account = 500
#my_account.account_type = 'savings'

#newbank = Customer.new(gets.strip, gets.strip, gets.strip, gets.strip)
#
#newbank.cust_info
#
#puts newbank.push_to_db



#Bank

