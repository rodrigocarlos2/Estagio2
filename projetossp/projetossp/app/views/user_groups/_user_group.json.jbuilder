json.extract! user_group, :id, :name, :description, :level, :created_at, :updated_at
json.url user_group_url(user_group, format: :json)