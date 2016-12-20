class CreateParentChildren < ActiveRecord::Migration[5.0]
  	def change
    	create_table :parent_children do |t|
    		t.integer  "parent_id", null: false
    		t.integer  "child_id", null: false
      		t.timestamps
    	end
  	end
end
