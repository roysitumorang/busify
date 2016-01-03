json.array!(@bus_types) do |bus_type|
  json.extract! bus_type, :id, :name, :capacity, :left, :right, :facilities
  json.url bus_type_url(bus_type.slug, format: :json)
end
