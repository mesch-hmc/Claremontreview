namespace :task do
  desc "import json into db"
  task importjson: :environment do
    File.open(File.dirname(__FILE__)+'/../../scraper/courses.json') do |file|
      JSON.parse(file.read).each do |course_attr|
        Course.create! course_attr
      end
    end
  end

  task slug: :environment do
    Course.all.each do |course|
      course.slug = course.code.gsub(" ", "_")
      course.save
    end
  end

  task avg: :environment do
    Course.all.each do |course|
      avg = course.reviews.average(:rating)
      if avg.nil?
        avg = 0.0
      end
      course.update_column(:avg_rating, avg)
    end
  end
end
