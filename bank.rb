


class Account < Customer
  attr_accessor :account, :account_type, :balance, :last_accessed
  @account_array = []
  def create_array
    @account_array << [@customer, @account, @account_type, @balance, @last_accessed]
  end
  p @account_array
end

my_account = Account.new
my_account.account = 500
my_account.account_type = 'savings'