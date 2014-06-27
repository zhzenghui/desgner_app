json.array!(@templates) do |template|
  json.extract! template, :id, :name, :spell, :version, :status
  json.url template_url(template, format: :json)
end
