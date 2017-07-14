class CreateBookTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :books do |t|
  		t.string :title
  		t.integer :author_id
  		t.integer :category_id
  		t.boolean :out
  	end
  end
end
