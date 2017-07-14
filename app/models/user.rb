class User < ActiveRecord::Base
	has_many :user_books
	has_many :books, through: :user_books

	def check_out_book(book)
		if find_borrowed(book)
			puts "That book is currently out! It will be returned on: #{self.find_borrowed(book).due_date}"
		else
			b = self.user_books.create(book: book)
			b.save
			puts "Book successfully checked out! It will be due on: #{b.due_date}"
		end
	end

	def return_book(book)
		self.find_borrowed(book).update(returned: true)
		puts "Thank you for returning #{book.title}!"
	end

	def find_borrowed(book)
		self.user_books.find_by(book_id: book.id, returned: false)
	end

	def num_books_borrowed
		self.books.size
	end

	def books_currently_borrowing
		Book.find(self.user_books.where(returned: false).pluck(:book_id))
	end

	def num_books_currently_borrowing
		books_currently_borrowing.size
	end
end