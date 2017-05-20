json.extract! question, :id, :type, :description, :default, :created_at, :updated_at
json.url question_url(question, format: :json)