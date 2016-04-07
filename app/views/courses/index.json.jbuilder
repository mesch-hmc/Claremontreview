json.array!(@courses) do |course|
  json.extract! course, :id, :code, :title, :instructor, :credits, :description, :requirements, :term
  json.url course_url(course, format: :json)
end
