class Author < ActiveRecord::Base
	has_many :books
	has_many :categories, through: :books
	has_many :user_books

	def how_many_checked_out
		self.books.pluck(:out).count(true)
	end

end