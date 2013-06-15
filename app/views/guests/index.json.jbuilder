json.array!(@guests) do |guest|
  json.extract! guest, :address_id, :guest_id, :first_name, :last_name, :title, :email, :twenty_one, :eighteen
  json.url guest_url(guest, format: :json)
end