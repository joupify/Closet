json.extract! order, :id, :name, :email, :address, :pay_method, :created_at, :updated_at
json.url order_url(order, format: :json)
