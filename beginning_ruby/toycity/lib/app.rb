require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
puts Time.now.strftime('%d %b %Y')

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
  # Print the name of the toy
  # Print the retail price of the toy
  # Calculate and print the total number of purchases
  # Calculate and print the total amount of sales
  # Calculate and print the average price the toy sold for
  # Calculate and print the average discount (% or $) based off the average sales price

puts "********** \n\n"

products_hash["items"].each do |toy|
  puts "title: #{toy["title"]}"
  puts "retail price: $#{toy["full-price"]}"
  puts "total purchases: $#{toy["purchases"].length}"

  # calculate total sales per product
  total_sales = 0.00
  toy["purchases"].each do |product|
    total_sales += product["price"]
  end
  puts "total sales: $#{total_sales}"

  # caluclate average price
  average_price = total_sales / toy["purchases"].length
  puts "average price: $#{average_price}"

  # calculate averate discount
  puts "average discount: $#{toy["full-price"].to_f - average_price}"

  puts "\n\n**********\n\n"
end



	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
  # Print the name of the brand
  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  # Calculate and print the total revenue of all the brand's toy sales combined

puts "********** \n\n"

brands = products_hash["items"].map { |toy|  toy["brand"] }.uniq

brands.each do |brand|
  products = products_hash["items"].select { |toy| toy["brand"] == brand }
  puts "Brand: #{ brand }"
  puts "Number of products: #{ products.length }"

  # Calculate Total Purchase Price
  total = 0
  products.each do |product|
    total = product["purchases"].inject(total) { |sum, sale| sum + sale["price"] }
  end

  puts "Average Price: $#{(total / products.length).round(2)}"
  puts "Total Sales: $#{total.round(2)}"

  puts "\n\n**********\n\n"
end







