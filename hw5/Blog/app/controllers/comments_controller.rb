class CommentsController < ApplicationController
  # before_action :authenticate_user!#, :find_question
  before_action :find_post
  # before_action :find_answer#, :authorize_user!, only: [:destroy]

def create
  @comment = Comment.new(comment_params)
  @comment.post = @post
  # @comment.user = current_user # in order to add name next to answers
  #------------------------------------------------------------------------
  if @comment.save
    redirect_to post_path(@post)
  else
    @comments = @post.comments.order(created_at: :desc)
    render 'posts/show'
  end
end
  #
  # def destroy
  #
  #   @answer.destroy
  #   redirect_to question_path(@question)
  # end


private

  def comment_params
    params.require(:comment).permit(:body)
  end
  #
  def find_post
    @post = Post.find params[:post_id]
  end
  #
  # def find_answer # add this (from destroy)
  #   @answer = Answer.find params[:id]
  # end
  #
  # def authorize_user! # add find_answer, then add before_action on top
  #   unless can?(:manage, @answer)
  #     flash[:alert] = "Access Denied!"
  #     redirect_to home_path
  #   end
  # end




end
