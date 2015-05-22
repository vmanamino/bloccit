class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    
    authorize favorite
    
    if favorite.save
      redirect_to [@post.topic, @post], notice: "You favorited the post successfully!"
      
    else
      flash[:error] = "There was an error in favoriting the post!"
      render :new
      
    end
    
  end 
  
  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    
    authorize favorite
        
    if favorite.destroy
      redirect_to [@post.topic, @post], notice: "Removed favorite."
    else
      flash[:error] = "Could not remove favorite.  Try again!"
      render :new
      
    end
  end
  
end
