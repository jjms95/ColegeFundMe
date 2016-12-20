class AddForeignKeyToParentChild < ActiveRecord::Migration[5.0]
  	def change
  	  	add_foreign_key :parent_children, :users, column: :parent_id
  		add_foreign_key :parent_children, :users, column: :child_id
 	end
end
