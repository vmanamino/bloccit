class FavoriteMailer < ApplicationMailer
  default from: "vmanamino@gmail.com"
  
  def new_comment(user, post, comment)
    
    #new headers
    headers["Message-ID"] = "<comments/#{comment.id}@viral-bloccit.example"
    headers["In-Reply-To"] = "<post/#{post.id}@viral-bloccit.example"
    headers["References"] = "<post/#{post.id}@viral-bloccit.example"
    
    @user = user
    @post = post
    @comment = comment
    
    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
