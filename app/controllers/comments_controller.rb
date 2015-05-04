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
      
  
end
