json.extract! parent_child, :id, :created_at, :updated_at,:parent_email,:parent_name,:child_name,:child_email
json.url parent_child_url(parent_child, format: :json)