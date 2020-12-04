# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザー
user100 = User.create!(id: 100, email: 'test100@gmail.com', password: 'password', admin: false)
user200 = User.create!(id: 200, email: 'test200@gmail.com', password: 'password', admin: false)
user300 = User.create!(id: 300, email: 'test300@gmail.com', password: 'password', admin: false)
user400 = User.create!(id: 400, email: 'test400@gmail.com', password: 'password', admin: false)
admin = User.create!(id: 1000, email: 'admin@gmail.com', password: 'adminpass', admin: true)

# プロフィール
profile = Profile.create!(
	[{id:100,user_id:100,nickname:'ハナ',introduction:'駆け出しPHPエンジニアです。'},
	{id:200,user_id:200,nickname:'Jacky',introduction:'Webデザイナー目指しています。'},
	{id:300,user_id:300,nickname:'トオル',introduction:'React/Vueが好きです。'},
	{id:400,user_id:400,nickname:'ニーナ',introduction:'Railsのエンジニアです。'}
	]
)

# 募集
board = Board.create!(
	[
		{id:100,user_id:100,name:'PHPのメンター募集！',content:'駆け出しのPHPエンジニアです。メンターを募集しています。',tag_list:'PHP,プログラマー'},
		{id:200,user_id:200,name:'プログラマー募集！',content:'私の制作したデザインに基づきWebアプリを制作してくれる方募集中です',tag_list:'Webデザイン,Webアプリ制作'}
	]
)

# カテゴリ
programmer = Category.create(name:'プログラマー')
programmer_ruby = programmer.children.create(name:'Ruby/Rails')
programmer_php = programmer.children.create(name:'PHP/Laravel')
programmer_phthon = programmer.children.create(name:'Phthon')
programmer_java = programmer.children.create(name:'Java')
programmer_C = programmer.children.create(name:'C/C#')
programmer_javascript = programmer.children.create(name:'Javascript')
programmer_other = programmer.children.create(name:'その他')
