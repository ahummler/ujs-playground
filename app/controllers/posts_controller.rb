class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  	respond_to do |format|
  		format.html
  		format.js { flash[:notice] = "Houston we have a problem"}
  	end
  end

  def show
  	@post = Post.find(params[:id])
  end

  
  def create
  	@post = Post.new(params.require(:post).permit(:title, :body))
  	if @post.save
  		respond_to do |format|
  			format.html { redirect_to @post, notice: "New Post created" }
  			format.js { flash[:notice] = "Houston we have a problem"}
  		end
	else
		respond_to do |format|
	  		format.html {render :new}
	  		format.js
	  	end
	  end
end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	respond_to do |format|
  	  format.html {redirect_to posts_path, notice: "Post purged!"}
  	  format.js {render nothing: true}
  	end
  end
end
