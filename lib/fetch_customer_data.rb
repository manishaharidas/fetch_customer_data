require "json"

module FetchCustomerData
=begin
Reads the json file for customer data
=end
  def self.fetch_data(file_path)
    if File.exists?(file_path)
      puts "Reading the json file for customer data"
      file = File.read file_path
      customer_data = JSON.parse(file)
      user_data = self.fetch_user_data(customer_data)
      puts "-- USER DETAILS --"
      user_data.keys.each do |key|
      	puts "#{key} : #{user_data[key]}"
      end	
      product_data = self.fetch_product_data(customer_data)
      puts "-- PRODUCT DETAILS --"
      product_data.keys.each do |key|
      	puts "#{key} : #{product_data[key]}"
      end	
      return true
    else
    	puts "ERROR: Invalid json file path"  
    end
  end
    
=begin
Consolidates the user json data
=end
  def self.fetch_user_data(customer_data)
  	user_data = {}
  	user_details = customer_data['data']['attributes'] || {}
  	if user_details
  		username = [user_details['first-name'], user_details["last-name"]] 
	  	user_data = {
	  		"Phone Number" => user_details['contact-number'],
	  		"Email" => user_details['email-address'],
	  		"Name" => [user_details['title'], username.join(" ")].join(". ")
	  	}
	  end
    return user_data
  end

=begin
Consolidates the product json data
=end
  def self.fetch_product_data(customer_data)
  	product_data, product_details = {}, {}
  	other_details = customer_data['included'] || []
  	if other_details.count > 0
  		other_details.each{|d| product_details = d["attributes"] if d["type"] === "products"}
	  	if product_details
		  	product_data = {
		  		"Product Name" => product_details['name']
		  	}
		  end		
  	end	
    return product_data
  end

end
