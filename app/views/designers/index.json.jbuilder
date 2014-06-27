json.array!(@designers) do |designer|
  json.extract! designer, :id, :degn_id, :name, :spell, :template
  json.url designer_url(designer, format: :json)
end
