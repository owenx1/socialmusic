json.extract! review, :id, :body, :post_id, :parent_id, :created_at, :updated_at
json.url review_url(review, format: :json)
