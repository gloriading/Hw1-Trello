class CommentMailer < ApplicationMailer
  def notify_post_owner(comment)
    @comment = comment
    @post = comment.post
    @post_owner = comment.post.user
    mail(
      to: @post_owner.email,
      subject: 'You got a new comment!'
    )
  end
end
