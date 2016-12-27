namespace :task do
  desc "import json into new database"
  task importjson: :environment do
    File.open(File.dirname(__FILE__)+'/../../scraper/dist/courses.json') do |file|
      JSON.parse(file.read).each do |course_data|
        Course.create! course_data
      end
    end
  end

  task slug: :environment do
    Course.all.each do |course|
      slug = course.code.gsub(" ", "_")
      course.update_column(:slug, slug)
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
      code_title_instructor = "#{course.code} #{course.title} #{course.instructor}"
      course.update_column(:code_title_instructor, code_title_instructor)
    end
  end

  # update an exisiting database with a json file
  task updatejson: :environment do
    File.open(File.dirname(__FILE__)+'/../../scraper/dist/courses.json') do |file|
      JSON.parse(file.read).each do |course_data|
        if Course.exists?(code: course_data['code'])
          course = Course.where(code: course_data['code']).first
          if course.title != course_data['title']
            course.update_column(:title, course_data['title'])
          end
          if course.instructor != course_data['instructor']
            course.update_column(:instructor, course_data['instructor'])
          end
          if course.credits != course_data['credits'].to_f
            course.update_column(:credits, course_data['credits'].to_f)
          end
          if course.description != course_data['description']
            course.update_column(:description, course_data['description'])
          end
        else
          Course.create! course_data
        end
      end
    end
  end
end
