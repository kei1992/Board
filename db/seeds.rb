# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(id: 2, email: 'test1@gmail.com', password: 'password', admin: false)
user2 = User.create!(id: 3, email: 'test2@gmail.com', password: 'password', admin: false)
admin = User.create!(id: 1, email: 'admin@gmail.com', password: 'adminpass', admin: true)
