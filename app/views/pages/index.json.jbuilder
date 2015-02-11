json.array!(@pages) do |page|
  json.extract! page, :id, :number, :imageurl
  json.url page_url(page, format: :json)
end
