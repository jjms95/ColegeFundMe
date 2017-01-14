class CreateKeyDonorChildren < ActiveRecord::Migration[5.0]
		def change
			create_table :key_donor_children do |t|
				t.integer  "key_donor_id", null: false
				t.integer  "child_id", null: false
				t.string :donor_name
				t.string :donor_email
				t.string :student_name
				t.string :student_email
				t.string :relationship_with_student
				t.timestamps
			end
			add_foreign_key :key_donor_children, :users, column: :key_donor_id
			add_foreign_key :key_donor_children, :users, column: :child_id
		end
end
