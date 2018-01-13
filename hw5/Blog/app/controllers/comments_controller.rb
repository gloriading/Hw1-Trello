class CommentsController < ApplicationController
  before_action :authenticate_user!, :find_post
  before_action :find_comment, :authorize_user!, only: [:destroy]

def create
  @comment = Comment.new(comment_params)
  @comment.post = @post
  @comment.user = current_user # in order to add name next to answers
  #------------------------------------------------------------------------
  if @comment.save
    # CommentMailer.notify_post_owner(@comment).deliver_now
    PostReminderJob.set(wait: 1.minute).perform_later
    redirect_to post_path(@post)
  else
    @comments = @post.comments.order(created_at: :desc)
    render 'posts/show'
  end
end

  def destroy

    @comment.destroy
    redirect_to post_path(@post)
  end


private

  def comment_params
    params.require(:comment).permit(:body)
  end
  #
  def find_post
    @post = Post.find params[:post_id]
  end

  def find_comment
    @comment = Comment.find params[:id]
  end
  #
  def authorize_user!
    unless can?(:crud, @comment)
      flash[:alert] = "Access Denied!"
      redirect_to home_path
    end
  end




end
