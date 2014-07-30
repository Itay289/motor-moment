class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show  ]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(secure_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Your post: #{@post.title} has been saved"
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end  

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      flash[:notice] ="Sorry, you can't edit this post"
      redirect_to new_post_path
    end
  end   

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(secure_params)
      flash[:notice] = "Your post #{@post.title} has been updated"     
    end 
  end   

  def destroy
    Post.find(params[:id]).destroy 
  end  

  private

    def secure_params
      params.require(:post).permit(:name, :title, :post, :image)
    end

end
