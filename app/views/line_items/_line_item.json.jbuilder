json.extract! line_item, :id, :price, :item_name, :category_name, :category_id, :item_id, :quantity_type, :quantity_count, :created_at, :updated_at
json.url line_item_url(line_item, format: :json)
