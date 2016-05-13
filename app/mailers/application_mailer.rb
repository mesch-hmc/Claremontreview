class ApplicationMailer < ActionMailer::Base
  default from: ENV['MESCH_EMAIL']
  layout 'mailer'
end
