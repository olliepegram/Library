json.extract! book, :id, :title, :author, :user_id, :created_at, :updated_at
json.url book_url(book, format: :json)