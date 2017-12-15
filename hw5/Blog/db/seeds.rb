PASSWORD = '123'

# order matters

Post.destroy_all
User.destroy_all
# super_user is the user we can trust (for testing)
super_user = User.create(
  first_name: 'Jon',
  last_name: 'Snow',
  email: 'js@gmail.com',
  password: PASSWORD
)

10.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD
  )
end

users = User.all
puts Cowsay.say("Create #{users.count} users", :tux)
#-----------------------------------------------------add `user` after association
100.times do
  Post.create(
    title: Faker::RickAndMorty.quote,
    body: Faker::HitchhikersGuideToTheGalaxy.quote,
    user: users.sample
  )
end

posts = Post.all
puts Cowsay.say("Create #{posts.count} posts", :ghostbusters)
#-------------------------------------------------------------------------------
# puts "Login as admin with #{super_user.email} and password of '#{PASSWORD}'!"
puts "Login with #{super_user.email} and password of '#{PASSWORD}'!"
