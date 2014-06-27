json.array!(@app_statuses) do |app_status|
  json.extract! app_status, :id, :name
  json.url app_status_url(app_status, format: :json)
end
