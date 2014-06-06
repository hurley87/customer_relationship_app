require_relative "contact"
require_relative "rolodex"


class CRM 
	def initialize
		@rolodex = Rolodex.new
	end
	def main_menu
		print_main_menu
  	user_selected = gets.to_i
  	call_option(user_selected)
	end
	def print_main_menu
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
	  contact = Contact.new(first_name, last_name, email, note)
	  @rolodex.add_contact(contact)
	  main_menu
  end
  def modify_existing_contact
  	puts "Please enter users last name:"
  	name = gets.chomp
  	@rolodex.edit_contact(name)
  	main_menu
  end
  def display_contacts
  	@rolodex.display_contacts
  	main_menu
  end
  def delete_contact
  	puts "Enter name of user youd like to delete: "
  	name = gets.chomp
  	@rolodex.delete(name)
  end
end

start = CRM.new
start.main_menu
start.main_menu