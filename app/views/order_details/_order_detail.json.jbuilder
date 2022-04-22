json.extract! order_detail, :id, :Order_id, :Item_id, :quantity, :price, :created_at, :updated_at
json.url order_detail_url(order_detail, format: :json)
