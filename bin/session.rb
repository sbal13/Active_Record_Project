class Session

	attr_accessor :user

	def initialize(user)
		@user = user
	end

	def display_top_menu(repeat = false)
		system('clear')
		puts nil
		puts nil
		puts "Hi #{user.name}! You are now logged in!" if !repeat
		puts nil
		puts nil
		puts "Here are your options: "

		puts("1. Borrow a book")
		puts("2. Return a book")
		puts("3. See your borrowed books")
		puts("4. List all books")
		puts("5. Exit this session")
		puts nil
		puts nil

		choice = gets.strip

		case choice
		when "1"
			display_all_book_list{which_book?(:borrow)}
		when "2"
			display_borrowed_books{which_book?(:return)}
		when "3"
			display_borrowed_books
		when "4"
			display_all_book_list
		when "5"
			exit_session
		else 
			puts "I didn't understand that! Please try again!"
			display_top_menu(true)
		end

	end

	def exit_session
		system('clear')
		puts "You are now exiting your session at the Library. Goodbye #{self.user.name}! Have a great day!"
	end 

	def which_book?(action)
		puts "Enter the number of the book you would like to #{action}: "
		puts nil
		puts nil
		choice = gets.strip.to_i

		if Book.all.size >= choice && choice > 0
			if action == :borrow
				self.user.check_out_book(Book.all[choice-1])
			else action == :return
				self.user.return_book(self.user.books_currently_borrowing[choice-1])
			end
		else
			puts "Not a valid choice!"
		end
	end

	def display_borrowed_books
		system ('clear')
		puts nil
		if self.user.books_currently_borrowing.empty?
			puts "You have no books out right now!" 
			return
		else
			puts nil
		end
		puts nil

		puts "You are currently borrowing: "
		self.user.books_currently_borrowing.each_with_index{|book, index| puts "#{index+1}. " + book.title +  " by " + book.author.name}
		puts nil

		yield if block_given?

		puts "Press enter when you are done viewing the books."
		gets.strip
	end

	def display_all_book_list

		system('clear')
		puts nil
		puts nil
		puts nil

		puts "The library currently has these books available: "
		Book.all.each_with_index do |book, index|
			if !book.user_books.empty? && book.user_books.any?{|rental| rental.returned == false}
				status = "Not available"
			else 
				status = "Available"
			end

			puts "#{index+1}. #{book.title} by #{book.author.name}"
			puts "Status: " + status
			puts nil
			puts "_______________________________________________"
		end

		yield if block_given?

		puts "Press enter when you are done viewing the books."
		gets.strip

	end


end