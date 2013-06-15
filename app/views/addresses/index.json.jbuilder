json.array!(@addresses) do |address|
  json.extract! address, :street_address, :city, :state, :zip_code
  json.url address_url(address, format: :json)
end