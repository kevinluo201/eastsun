json.extract! invoice, :id, :total, :delivered, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
