json.extract! virtual_order, :id, :name, :phone, :address, :product_count, :payment, :created_at, :updated_at
json.url virtual_order_url(virtual_order, format: :json)