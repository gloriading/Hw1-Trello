class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

#---new post form ----------------------------------------------------------
  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end
#---posts index---------------------------------------------------------------
  def index
    # @posts = Post.all.order(created_at: :desc)
    @post_count = Post.count
    @posts = Post.order(created_at: :desc).page(params[:page]).per(6) # pagination
  end

#---search posts by title or body -------------------------------------------
  def search
    # note: seach box is at navbar, using GET method instead of POST 
    @search_results = Post.search(params[:search]) if params[:search].present?
  end

#---show a post and its comments---------------------------------------------
  def show
    # for showing individual page title (go to application.html.erb)
    @page_title = @post.title
    # display all the comments under a post
    @comments = @post.comments.order(created_at: :desc)
    @comment = Comment.new # display a form for writing comments
  end
#---edit a post--------------------------------------------------------------
  def edit

  end

  def update

    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
#---delete a post -----------------------------------------------------------
  def destroy

    @post.destroy

    redirect_to posts_path
  end

#----------------------------------------------------------------------------
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find params[:id]
  end

  def authorize_user!
    unless can?(:manage, @post)
      # @post here is defined in find_post
      flash[:alert] = 'Access Denied!'
      redirect_to home_path
    end
  end
end
