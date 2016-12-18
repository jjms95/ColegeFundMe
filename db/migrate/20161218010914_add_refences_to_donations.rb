class AddRefencesToDonations < ActiveRecord::Migration[5.0]
  	def change
  		add_column :donations,:student_id,:integer, null: false
  		add_column :donations,:donor_id,:integer, null: false
  		add_foreign_key :donations, :users, column: :student_id
  		add_foreign_key :donations, :users, column: :donor_id
  	end
end
