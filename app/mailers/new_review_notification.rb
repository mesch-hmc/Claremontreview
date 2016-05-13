class NewReviewNotification < ApplicationMailer
  default from: 'notifications@claremontreview.com'

  def notify(review)
    @review = review
    mail(to: ENV['MESCH_EMAIL'], subject: 'New course review - ' + @review.course.slug)
  end
end
