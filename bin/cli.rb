require_relative '../config/environment.rb'

def welcome
	system ('clear')
	puts "Hello, and welcome to the Library!"
	sleep(1)
end

def visited?
	puts "Have you visited us before? (y/n)"
	choice = gets.strip.downcase

	if choice == "y"
		find_user
	elsif choice == 'n'
		create_new_user do
			puts "Okay! Tell us your name so we can get started: "
			gets.strip
		end
	else
		puts "Sorry I didn't understand that. Please try again."
		sleep(1)
		visited?
	end
end

def find_user
	system('clear')
	puts "Please tell us your name and we can get started: "
	input_name = gets.strip

	current_user = User.find_by(name: input_name)

	if current_user
		current_user
	else
		cant_find(input_name)
	end

end

def cant_find(name)
	system('clear')
	puts "We didn't find you in our database! Would you like to try again or create a new account?"
	puts "1. Try again"
	puts "2. Create new account"
	answer = gets.strip

	case answer
	when "1"
		find_user
	when "2"
		create_new_user(name)
	else
		puts "Sorry, I didn't understand that. Please try again."
		sleep(1)
		cant_find(name)
	end
end

def continue_session?(name)
	puts "Would you like to continue this session as user '#{name}'? (y/n)"
	choice = gets.strip.downcase
	if choice == 'y'
		true
	elsif choice == 'n'
		false
	else
		puts "Sorry I didn't understand that. Please try again."
		sleep(1)
		continue?
	end

end

def continue_library?
	puts "Would you like to continue using the library? (y/n)"
	choice = gets.strip.downcase
	if choice == 'y'
		true
	elsif choice == 'n'
		false
	else
		puts "Sorry I didn't understand that. Please try again."
		sleep(1)
		continue_library?
	end

end


# def exit_library(name = 'visitor')
# 	system('clear')
# 	puts "Goodbye #{name}! Have a great day!"
# end 



def create_new_user(name = "")
	system ('clear')
	name = yield if block_given?
	puts "Your account has been created!"
	User.create(name: name)
end


# def display_top_menu(user, repeat = false)
# 	system('clear')
# 	puts nil
# 	puts nil
# 	puts "Hi #{user.name}! You are now logged in!" if !repeat
# 	puts nil
# 	puts nil
# 	puts "Here are your options: "

# 	puts("1. Borrow a book")
# 	puts("2. Return a book")
# 	puts("3. See your borrowed books")
# 	puts("4. List all books")
# 	puts("5. Exit")
# 	puts nil
# 	puts nil

# 	choice = gets.strip

# 	case choice
# 	when "1"
# 		display_all_book_list(user){|user| which_book?(user, :borrow)}
# 	when "2"
# 		display_borrowed_books(user){|user| which_book?(user, :return)}
# 	when "3"
# 		display_borrowed_books(user)
# 	when "4"
# 		display_all_book_list(user)
# 	when "5"
# 		exit_library(user.name)
# 	else 
# 		puts "I didn't understand that! Please try again!"
# 		display_top_menu(user, true)
# 	end

# end

# def which_book?(user, action)
# 	puts "Enter the number of the book you would like to #{action}: "
# 	puts nil
# 	puts nil
# 	choice = gets.strip.to_i

# 	if Book.all.size >= choice && choice > 0
# 		if action == :borrow
# 			user.check_out_book(Book.all[choice-1])
# 		else action == :return
# 			user.return_book(user.books_currently_borrowing[choice-1])
# 		end
# 	else
# 		puts "Not a valid choice!"
# 	end
# end

# def display_borrowed_books(user)

# 	system ('clear')
# 	puts nil
# 	if user.books_currently_borrowing.empty?
# 		puts "You have no books out right now!" 
# 		return
# 	else
# 		puts nil
# 	end
# 	puts nil

# 	puts "You are currently borrowing: "
# 	user.books_currently_borrowing.each_with_index{|book, index| puts "#{index+1}. " + book.title +  " by " + book.author.name}
# 	puts nil

# 	yield(user) if block_given?

# 	puts "Press enter when you are done viewing the books."
# 	gets.strip
# end

# def display_all_book_list(user)

# 	system('clear')
# 	puts nil
# 	puts nil
# 	puts nil

# 	puts "The library currently has these books available: "
# 	Book.all.each_with_index do |book, index|
# 		if !book.user_books.empty? && book.user_books.any?{|rental| rental.returned == false}
# 			status = "Not available"
# 		else 
# 			status = "Available"
# 		end

# 		puts "#{index+1}. #{book.title} by #{book.author.name}"
# 		puts "Status: " + status
# 		puts nil
# 		puts "_______________________________________________"
# 	end

# 	yield(user) if block_given?

# 	puts "Press enter when you are done viewing the books."
# 	gets.strip

# end


