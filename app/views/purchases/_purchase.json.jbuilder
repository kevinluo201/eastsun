json.extract! purchase, :id, :item_id, :price, :amount, :date, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
