class UserBook < ActiveRecord::Base
	belongs_to :user
	belongs_to :book
	after_create :default_vals

	def default_vals
		self.returned = false
		self.due_date = Time.now
	end
end