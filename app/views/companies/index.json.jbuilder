json.array!(@companies) do |company|
  json.extract! company, :id, :name, :slug, :operator_types, :address, :phones
  json.url company_url(company.slug, format: :json)
end
