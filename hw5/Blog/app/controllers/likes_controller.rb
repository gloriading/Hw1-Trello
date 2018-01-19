class LikesController < ApplicationController
  before_action :authenticate_user!

    def create
      p = Post.find params[:post_id]
       if can? :like, p
           like = Like.new(post: p, user: current_user)
           if like.save
             redirect_to p, notice: 'Liked'

           else
             redirect_to p, alert: 'Couldn\'t like'
           end
       else
         head :unauthorized
       end
    end

    def destroy
      like = Like.find params[:id]
      if can? :destroy, like
        like.destroy
        redirect_to post_path(like.post), notice: 'Like removed'
      else
        head :unauthorized
      end
    end


end
