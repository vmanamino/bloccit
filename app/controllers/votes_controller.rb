class VotesController < ApplicationController
  
  before_action :load_post_and_vote
  
  def up_vote
    @post = Post.find(params[:post_id])
    
    @vote = @post.votes.where(user_id: current_user.id).first
    
    if @vote
      @vote.update_attribute(:value, 1)
    else
      @vote = current_user.votes.create(value: 1, post: @post)
    end
    
    redirect_to :back
  end
  
  private
  def load_post_and_vote
    @post = Post.find(params[:post_id])
    @vote = @post.votes.where(user_id: current_user.id).first
  end
end