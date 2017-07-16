# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(email: 'admin@user.com',username: 'admin', password: 'password', password_confirmation: 'password')
user.add_role :admin
user.skip_confirmation!
user.save!

u1 = User.new(email: 'simple@user.com',username: 'user', password: 'password', password_confirmation: 'password')
u1.skip_confirmation!
u1.save!

u2 = User.new(email: 'other@user.com',username: 'resu', password: 'password', password_confirmation: 'password')
u2.skip_confirmation!
u2.save!
