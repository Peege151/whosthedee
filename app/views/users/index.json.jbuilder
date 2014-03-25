json.array!(@users) do |user|
  json.extract! user, :id, :name, :city_id, :burrough_id, :hood_id, :email, :password_digest, :remember_token, :image
  json.url dog_url(dog, format: :json)
end