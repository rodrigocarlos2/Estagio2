json.extract! person, :id, :name, :rg, :cpf, :gender, :phone, :cell_phone, :photo, :created_at, :updated_at
json.url person_url(person, format: :json)