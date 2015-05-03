class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    authorize @comment
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
