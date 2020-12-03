# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user100 = User.create!(id: 100, email: 'test100@gmail.com', password: 'password', admin: false)
user200 = User.create!(id: 200, email: 'test200@gmail.com', password: 'password', admin: false)
user300 = User.create!(id: 300, email: 'test100@gmail.com', password: 'password', admin: false)
user400 = User.create!(id: 400, email: 'test200@gmail.com', password: 'password', admin: false)
admin = User.create!(id: 1000, email: 'admin@gmail.com', password: 'adminpass', admin: true)

# programmer = Category.create(name:'プログラマー')
# programmer_ruby = programmer.children.create(name:'Ruby/Rails')
# programmer_php = programmer.children.create(name:'PHP/Laravel')
# programmer_phthon = programmer.children.create(name:'Phthon')
# programmer_java = programmer.children.create(name:'Java')
# programmer_C = programmer.children.create(name:'C/C#')
# programmer_javascript = programmer.children.create(name:'Javascript')
# programmer_other = programmer.children.create(name:'その他')
