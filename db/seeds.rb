puts 'Creating user'
user = User.create!(email: 'user@gmail.com', password: 'password', first_name: 'User', last_name: 'One', display_name: 'UserOne')
puts 'Users done!'

puts 'Creating video'
video = Video.new(user: user, name: 'big-movie')
video.save!
puts 'Video done!'
