class CreateParentChildren < ActiveRecord::Migration[5.0]
  	def change
    	create_table :parent_children do |t|
    		t.integer  "parent_id", null: false
    		t.integer  "child_id", null: false
    		t.string :parent_name
    		t.string :parent_email
    		t.string :child_name
    		t.string :child_email
      		t.timestamps
    	end
    	add_foreign_key :parent_children, :users, column: :parent_id
  		add_foreign_key :parent_children, :users, column: :child_id
  	end
end
