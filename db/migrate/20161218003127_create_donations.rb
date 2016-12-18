class CreateDonations < ActiveRecord::Migration[5.0]
  	def change
    	create_table :donations do |t|
      		t.float :amount, null: false
      		t.string :transaction_state, null: false
      		t.string :donor_email, null: false
      		t.string :student_email, null: false
      		t.timestamps
    	end
  	end
end
