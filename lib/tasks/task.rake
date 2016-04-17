namespace :task do
  desc "import json into db"
  task importjson: :environment do
    File.open(File.dirname(__FILE__)+'/../../scraper/courses.json') do |file|
      JSON.parse(file.read).each do |course_attr|
        Course.create! course_attr
      end
    end
  end
end
