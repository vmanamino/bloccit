# checks for unique post and creates one if non existent
if (Post.where(title: 'my unique title', body: 'my unique body').exists?)
  p = Post.where(title: 'my unique title', body: 'my unique body')
  puts "my unique post exists"
  puts p.to_json
  
else
  unique = Post.create!(
    title: 'my unique title',
    body: 'my unique body'
    )
  puts "unique post was created"
  puts unique.to_json
  
end

# assign unique post to variable, and call pluck method to get the id only
postUnique = Post.where(title: 'my unique title', body: 'my unique body')
pId = postUnique.pluck(:id)

#test for unique comment, create one if non existent.
if (Comment.where(body: 'my unique comment').exists?)
  c = Comment.where(body: 'my unique comment')
  puts "my unique comment exists"
  puts c.to_json
  
else
  unique_comment = Comment.create!(
    post_id: pId,
    body: 'my unique comment'
    )
  puts "unique comment was created"
  puts unique_comment.to_json
  
end


