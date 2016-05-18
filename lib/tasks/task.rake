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
      avg ||= 0.0
      course.update_column(:avg_rating, avg)
    end
  end

  task codetitleinstructor: :environment do
    Course.all.each do |course|
      course.code_title_instructor = "#{course.code} #{course.title} #{course.instructor}"
      course.save
    end
  end
end
