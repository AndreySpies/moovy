puts 'Creating user'
user = User.create!(email: 'user@gmail.com', password: 'password', first_name: 'User', last_name: 'One', display_name: 'UserOne')
user2 = User.create(email: 'user2@gmail.com', password: 'password', first_name: 'User', last_name: 'Two', display_name: 'UserTwo')
puts 'Users done!'

puts 'Creating video'
video = Video.new(user: user, name: 'big-movie')
video.miniature = Rails.root.join("app/assets/images/home-banner-2.jpg").open
video.save!
video2 = Video.new(user: user2, name: 'Little Movie')
video2.miniature = Rails.root.join("app/assets/images/home-banner.jpg").open
video2.save!
video3 = Video.new(user: user, name: 'Little Movie')
video3.miniature = Rails.root.join("app/assets/images/home-banner-2.jpg").open
video3.save!
video4 = Video.new(user: user2, name: 'Little Movie')
video4.miniature = Rails.root.join("app/assets/images/home-banner.jpg").open
video4.save!
video5 = Video.new(user: user, name: 'Little Movie')
video5.miniature = Rails.root.join("app/assets/images/home-banner-2.jpg").open
video5.save!
puts 'Video done!'
