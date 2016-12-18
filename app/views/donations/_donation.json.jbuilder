json.extract! donation, :id, :amount, :transaction_state, :donor_email, :student_email, :created_at, :updated_at
json.url donation_url(donation, format: :json)