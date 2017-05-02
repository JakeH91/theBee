class UserMailer < ApplicationMailer
	def contact_form(email, name, message)
		@message = message
		mail(:from => email,
				:to => 'jake_hill666@hotmail.co.uk',
				:subject => "A new contact form message from #{name}")
	end
end
