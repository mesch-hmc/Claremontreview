# Preview all emails at http://localhost:3000/rails/mailers/new_review_notification
class NewReviewNotificationPreview < ActionMailer::Preview
  def notify_review_mail_preview
    NewReviewNotification.notify(Review.first)
  end
end
