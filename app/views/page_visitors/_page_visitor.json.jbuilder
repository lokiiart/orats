json.extract! page_visitor, :id, :RemoteIP, :Page, :Referer, :created_at, :updated_at
json.url page_visitor_url(page_visitor, format: :json)