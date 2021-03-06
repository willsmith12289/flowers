json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :image, :price, :unit, :available
  json.url product_url(product, format: :json)
end
