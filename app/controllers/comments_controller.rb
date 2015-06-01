class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    authorize @comment
    @post = Post.find(params[:post_id])
    
    
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)    
    @comment.post = @post
    @new_comment = Comment.new
    authorize @comment
    if @comment.save
      flash[:notice] = "comment was saved"
      # redirect_to [@post.topic, @post], notice: "Comment was saved!"
    else 
      flash[:error] = "Error creating comment.  Try again"
      # render :new
    end
    
    respond_to do |format|
      format.html
      format.js
    end    
  end
  
  def destroy
    
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])    
    authorize @comment
    
    if @comment.destroy
      flash[:notice] = "Comment was removed"      
    else
      flash[:error] = "Comment couldn't be deleted. Try again."      
    end
    
    respond_to do |format|
      format.html
      format.js
    end
    
  end
  
  
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
      
  
end
