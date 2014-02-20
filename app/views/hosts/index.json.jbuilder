json.array!(@hosts) do |host|
  json.extract! host, :id, :name, :ip, :port, :suffix, :status, :token
  json.url host_url(host, format: :json)
end
