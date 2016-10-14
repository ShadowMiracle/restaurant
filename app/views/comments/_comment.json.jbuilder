json.extract! comment, :id, :name, :comment_text, :star, :food_item_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)