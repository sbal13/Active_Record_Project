class CreateCategoryTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :categories do |t|
		t.string :name
	end
  end
end