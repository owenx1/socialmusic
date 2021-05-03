json.extract! post, :id, :title, :artist, :genre, :about, :artwork, :created_at, :updated_at
json.url post_url(post, format: :json)
