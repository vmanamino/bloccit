require 'rails_helper'
 
 describe User do
 
   include TestFactories
 
   describe "#favorited(post)" do
     
     before do
       @user = authenticated_user
       @post = associated_post  
       @post_other = associated_post
       
     end
     it "returns `nil` if the user has not favorited the post" do
       expect(@user.favorited(@post)).to be_nil
     end
 
     it "returns the appropriate favorite if it exists" do
       favorite = @user.favorites.where(post: @post).create
       expect(@user.favorited(@post)).to eq(favorite)
     end
     
     it "returns `nil` if the user has favorited another post" do
       favorite_other = @user.favorites.where(post: @post_other).create
       expect(@user.favorited(@post)).to be_nil
       
     end
   end
 end