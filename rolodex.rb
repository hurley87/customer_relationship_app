class Rolodex
	attr_accessor :contacts
	def initialize 
		@contacts = []
		@contact_id = 1000
	end
	def add_contact(contact)
		contact.id = @contact_id
		@contacts << contact
		@contact_id += 1
	end
	def display_contacts
		puts "All contacts: "
		if @contacts.empty?
			puts "There are no contacts to display"
		else
			@contacts.each do |contact|
				puts contact.first_name
				puts contact.last_name
				puts contact.email
				puts contact.note
			end
		end
	end
	def edit_contact(id)
		puts "Which attribute would you like to change: "
		puts "[1] First Name "
  	puts "[2] Last Name"
  	puts "[3] Email"
  	puts "[4] Notes"
		user_input = gets.chomp.to_i
		puts "What would you like to change it to: "
		change = gets.chomp
		@contacts.each do |contact|
			 if contact.id == id
			 		case user_input
			 			when 1 
			 				contact.first_name = change
			 			when 2 
			 				contact.last_name = change
			 			when 3 
			 				contact.email = change
			 			when 4 
			 				contact.note = change
			 			else
			 				puts "Invalid Entry"
			 		end
			 end
		end
	end
	def delete(id)
		@contacts.each do |contact|
			@contacts.delete(contact) if contact.id == id
		end
	end
	def display_attribute(user_input)
		case user_input
			when 1 
				puts "First Names: "
				@contacts.each { |contact| puts contact.first_name }
			when 2
				puts "Last Names: "
				@contacts.each { |contact| puts contact.last_name }
			when 3
				puts "Emails: "
				@contacts.each { |contact| puts contact.email}
			when 4
				puts "Notes"
				@contacts.each { |contact| puts contact.note }
			else
				puts "Invalid Selection"
		end
	end
end