json.extract! message, :id, :user_id, :category_id, :content, :—skip-test-framework, :—skip-assets, :created_at, :updated_at
json.url message_url(message, format: :json)
