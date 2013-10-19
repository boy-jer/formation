class Formations < ActiveRecord::Base
require 'page'

	def create_user
		user = User.new
		user.first_name = self.first_name
		user.last_name = self.last_name
		user.email = self.email
		user.bank_account = self.bank_account
		user.routing_number = self.routing_number
		user.country = self.country
		user.save
		user
	end

	def create_page
		page = Page.new

    page.src = self.src
    page.amount = self.amount

    page.save
		page
	end


end
