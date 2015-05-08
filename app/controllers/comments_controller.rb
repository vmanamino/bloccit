class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    authorize @comment
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    
  end
  
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = current_user.comments.build(params.require(:comment).permit(:body))    
    @comment.post = @post
    authorize @comment
    if @comment.save
      redirect_to [@topic, @post], notice: "Comment was saved!"
    else 
      flash[:error] = "Error creating comment.  Try again"
      render :new
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])
    
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed"
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end
      
  
end
