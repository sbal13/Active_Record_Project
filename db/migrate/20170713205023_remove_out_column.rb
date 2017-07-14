class RemoveOutColumn < ActiveRecord::Migration[5.1]
  def change
  		remove_column :books, :out
  end
end
