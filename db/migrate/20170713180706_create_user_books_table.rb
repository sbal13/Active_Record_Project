class CreateUserBooksTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :user_books do |t|
  		t.integer :user_id
  		t.integer :book_id
  		t.boolean :returned
  		t.datetime :due_date
  		t.timestamp
  	end
  end
end
