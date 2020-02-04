require 'hirb'
require 'pp'
require 'colorize'

arr = [9004, "John", "Doe", "103-96-3912", "192 Main St, Manhattan, NY 10001"]
data = []

file = File.open(File.dirname(__FILE__) + "/data/customer.txt", "a") do |line|
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

file = File.open(File.dirname(__FILE__) + '/data/customer.txt', "r") do |line|
  line.each do |record|
    # puts record
    r = record.chomp
    data.append(r.split("_"))
  end
end

puts "I am now red".red
puts "I am now blue".blue
puts "Testing".yellow

puts Hirb::Helpers::AutoTable.render(
    data,
    fields: [0, 1, 2, 3, 4],  #Specify the index positions in each row array to include in the table and their column order in the table
    headers: {0 => 'Account #', 1 => 'First Name', 2 => "Last Name", 3 => "SSN", 4 => "Address"},  #Convert the column headers to something more desirable
    description: false #Get rid of "3 rows in set" following the table
)