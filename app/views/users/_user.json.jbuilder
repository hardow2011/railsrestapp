json.extract! user, :id, :id, :nombreUsuario, :password, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
