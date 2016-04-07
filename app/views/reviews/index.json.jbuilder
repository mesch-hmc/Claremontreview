json.array!(@reviews) do |review|
  json.extract! review, :id, :rank, :rating, :date, :info, :review_text
  json.url review_url(review, format: :json)
end