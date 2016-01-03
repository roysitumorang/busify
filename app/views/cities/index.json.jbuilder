json.array!(@cities) do |city|
  json.extract! city, :id, :name
  json.url province_cities_url(province.slug, format: :json)
end
