json.extract! ticket, :id, :ean_code, :amount, :state, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
