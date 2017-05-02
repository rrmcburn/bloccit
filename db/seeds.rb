require 'random_data'

# Create Topics

15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

 # Create Posts
 50.times do

   Post.create!(
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 # Create Sponsored Posts
 50.times do

   SponsoredPost.create!(
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     price: 50
   )
 end
 sponsoredposts = SponsoredPost.all

 # Create Comments

 100.times do
   Comment.create!(

     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 puts "#{Post.count}"
 Post.find_or_create_by(title: "Sample Title", body: "Sample body...")
 puts "#{Post.count}"

 puts "#{Comment.count}"
 Comment.find_or_create_by(post: posts.sample, body: "Sample body...")
 puts "#{Post.count}"

 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{SponsoredPost.count} sponsored posts created"
 puts "#{Comment.count} comments created"
