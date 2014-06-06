class Rolodex
	attr_accessor :contacts
	def initialize 
		@contacts = []
	end
	def add_contact(contact)
		@contacts << contact
	end
	def display_contacts
		puts "All contacts: "
		@contacts.each do |contact|
			puts contact.first_name
			puts contact.last_name
			puts contact.email
			puts contact.note
		end
	end
	def edit_contact(name)
	end
	def delete(name)
		@contacts.each do |contact|
			puts "hello" if contact.last_name == name 
		end
	end
end