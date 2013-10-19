json.array!(@formations) do |formation|
  json.extract! formation, 
  json.url formation_url(formation, format: :json)
end
