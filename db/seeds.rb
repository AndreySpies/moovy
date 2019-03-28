puts 'Creating user'
user = User.create!(email: 'user@gmail.com', password: 'senhasenha')
puts 'Users done!'

puts 'Creating video'
video = Video.new(user: user, name: 'big-movie')
video.save!
puts 'Video done!'
