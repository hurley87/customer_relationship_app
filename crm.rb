require_relative "contact"
require_relative "rolodex"


class CRM 
	attr_reader :name

	def self.run(name)
		crm = self.new(name)
		crm.main_menu
	end

	def initialize(name)
		@rolodex = Rolodex.new
		@name = name
	end

	def main_menu
		print_main_menu
  	user_selected = gets.to_i
  	call_option(user_selected)
	end
	def print_main_menu
			puts "--------------------------------"
			puts "            MAIN MENU"
			puts "--------------------------------"
		  puts "[1] Add a new contact"
	    puts "[2] Modify an existing contact"
	    puts "[3] Delete a contact"
	    puts "[4] Display all the contacts"
	    puts "[5] Display an attribute"
	    puts "[6] Exit"
	    puts "Enter a number: "
	end
	def call_option(user_selected)
		add_new_contact if user_selected == 1
  	modify_existing_contact if user_selected == 2
  	delete_contact if user_selected == 3
  	display_contacts if user_selected == 4
  	display_attribute if user_selected == 5
  	exit if user_selected == 6
	end
	def add_new_contact
	  print "Enter First Name: "
	  first_name = gets.chomp
	  print "Enter Last Name: "
	  last_name = gets.chomp
	  print "Enter Email Address: "
	  email = gets.chomp
	  print "Enter a Note: "
	  note = gets.chomp
	  @rolodex.add_contact(Contact.new(first_name, last_name, email, note))
	  main_menu
  end
  def find_user
  	puts "Enter user's unique ID: "
  	id = gets.chomp.to_i
  	id
  end
  def modify_existing_contact
  	id = find_user
  	@rolodex.edit_contact(id)
  	main_menu
  end
  def display_contacts
  	@rolodex.display_contacts
  	main_menu
  end
  def delete_contact
  	id = find_user
  	@rolodex.delete(id)
  	main_menu
  end
  def display_attribute
  	puts "Which attribute would you like to see?"
  	puts "[1] First Name "
  	puts "[2] Last Name"
  	puts "[3] Email"
  	puts "[4] Notes"
  	user_input = gets.chomp.to_i
  	@rolodex.display_attribute(user_input)
  	main_menu
  end
end

CRM.run("dave's CRM")
