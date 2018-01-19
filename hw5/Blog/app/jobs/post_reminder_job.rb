class PostReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    CommentMailer.notify_post_owner(Comment.last).deliver_now
  end
end
