json.array!(@dogs) do |dog|
  json.extract! dog, :id, :name, :nick, :primarybreed, :secondarybreed, :neighborhood, :age, :weight, :picture
  json.url dog_url(dog, format: :json)
end
