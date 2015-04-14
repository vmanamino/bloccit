class SummariesController < ApplicationController
  def index
    @summaries = Summary.all
    authorize @summaries
  end

  def new
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @summary = Summary.new
    authorize @summary
  end

  def show
    @summary = Summary.find(params[:id])
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    authorize @summary
  end

  def edit
    @summary = Summary.find(params[:id])
    @post = @summary.post
    @topic = @post.topic
    authorize @summary
  end
  
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @summary = current_user.summary.create(params.require(:summary).permit(:summary))
    authorize @summary
    if @summary.save
      redirect_to [@topic, @post,@summary], notice: "Summary was saved successfully"
    else
      flash[:error] = "Error creating topic.  Please try again."
      render :new
    end
  end
  
  def update
    @summary = Summary.find(params[:id])
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    authorize @summary
    if @summary.update_attributes(params.require(:summary).permit(:summary))
      redirect_to [@topic, @post, @summary]
    else
      flash[:error] = "Error saving summary.  Please try again."
      render :edit
    end
  end
end
