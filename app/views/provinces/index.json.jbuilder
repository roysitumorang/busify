json.array!(@provinces) do |province|
  json.extract! province, :id, :name
  json.url province_url(province.slug, format: :json)
end
