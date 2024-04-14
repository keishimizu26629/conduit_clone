class PostsController < ApplicationController
  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = 2 # ここではユーザーIDを2と仮定しています

    if @post.save
      category = Category.find_by(name: 'blanditiis')
      if category
        CategoryPost.create(post_id: @post.id, category_id: category.id)
      end
      redirect_to @post, notice: 'Post was successfully created.'
    else
      @categories = Category.all
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @categories = @post.categories
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
    @categories = @post.categories
    @user = @post.user
    @comments = @post.comments
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :content)
  end
end
