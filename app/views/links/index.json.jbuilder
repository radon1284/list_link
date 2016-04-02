json.array!(@links) do |link|
  json.extract! link, :id, :link_name, :description, :url, :user_id, :category_id
  json.url link_url(link, format: :json)
end
