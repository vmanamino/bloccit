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
     
   end
   
    describe ".top_rated" do
 
     before do
       @user1 = create(:user)
       post = create(:post, user: @user1)
       create(:comment, user: @user1, post: post)
 
       @user2 = create(:user)
       post = create(:post, user: @user2)
       2.times { create(:comment, user: @user2, post: post) }
     end
 
     it "returns users ordered by comments + posts" do
       expect( User.top_rated ).to eq([@user2, @user1])
     end
 
     it "stores a `posts_count` on user" do
       users = User.top_rated
       expect( users.first.posts_count ).to eq(1)
     end
 
     it "stores a `comments_count` on user" do
       users = User.top_rated
       expect( users.first.comments_count ).to eq(2)
     end
   end
   
   describe "method to create post and comment" do
     
     before do
       @user_with_post_and_comment = create(:user_with_post_and_comment)
       @user_post = @user_with_post_and_comment.posts.first
       @user_comment = @user_with_post_and_comment.comments.first
       @user = authenticated_user
       @post = associated_post
       @comment = Comment.new(body: 'My comment is really great', post: @post, user: @user)
       
       
     end
     
     it "returns 0 posts for the authenticated_user" do
       expect(@user.posts.count).to be(0)
     end
     
     it "returns 1 post when called" do
       expect(@user_with_post_and_comment.posts.count).to eq(1)
     end
     
     it "returns 0 comments for the authenticated_user" do
       expect(@user.comments.count).to be(0)
     end
     
     it "returns 1 comment when called" do
       expect(@user_with_post_and_comment.comments.count).to be(1)
     end
     
     it "returns post other than associated_post" do
       expect(@user_post.id).not_to be(@post.id)
     end
     
     it "returns comment other than authenticated user comment" do
       expect(@user_comment.id).not_to be(@comment.id)
     end
               
   end
 end