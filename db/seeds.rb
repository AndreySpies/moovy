# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating user'
user = User.create!(email: 'user@gmail.com', password: 'senhasenha')
puts 'Users done!'

puts 'Creating video'
video = Video.create!(user: user, name: 'big-movie')
puts 'Video done!'
