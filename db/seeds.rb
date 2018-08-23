# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Restaurant.destroy_all
Reservation.destroy_all

u1 = User.create!(first_name: "David", last_name: "Ma", username: "DMA", email: "dma@gmail.com", password: "123", password_confirmation: "123")
u2 = User.create!(first_name: "Joey", last_name: "Saha", username: "JSA", email: "jsa@gmail.com", password: "123", password_confirmation: "123")
u3 = User.create!(first_name: "Tyler", last_name: "Palef", username: "TPA", email: "tpa@gmail.com", password: "123", password_confirmation: "123")

Restaurant.create(name: "BK", opening_hour: "2000-01-01 08:30:00", closing_hour: "2000-01-01 11:30:00", max_capacity: 45, address: "123 Apple Street", price_range: "$", user_id: 1)
Restaurant.create(name: "McD", opening_hour: "2000-01-01 08:30:00", closing_hour: "2000-01-01 11:30:00", max_capacity: 35, address: "22 Jump Street", price_range: "$$", user_id: 2)
Restaurant.create(name: "RL", opening_hour: "2000-01-01 08:30:00", closing_hour: "2000-01-01 11:30:00", max_capacity: 35, user_id: 1)

r1 = Restaurant.create!(name: "BK", opening_hour: "2000-01-01 08:30:00", closing_hour: "2000-01-01 23:30:00", max_capacity: 45, user_id: u1.id, min_party_size: 1, max_party_size: 10)
r2 = Restaurant.create!(name: "McD", opening_hour: "2000-01-01 08:30:00", closing_hour: "2000-01-01 23:30:00", max_capacity: 35, user_id: u2.id, min_party_size: 2, max_party_size: 20)
r3 = Restaurant.create!(name: "RL", opening_hour: "2000-01-01 08:30:00", closing_hour: "2000-01-01 23:30:00", max_capacity: 35, user_id: u1.id, min_party_size: 3, max_party_size: 15)


Reservation.create!(date: "2018-08-25", time: "2000-01-01 15:10:00", party_size: 9, user_id: u1.id, restaurant_id: r1.id)
Reservation.create!(date: "2018-08-25", time: "2000-01-01 15:10:00", party_size: 9, user_id: u1.id, restaurant_id: r2.id)
Reservation.create!(date: "2018-08-25", time: "2000-01-01 15:10:00", party_size: 9, user_id: u1.id, restaurant_id: r3.id)
Reservation.create!(date: "2018-08-26", time: "2000-01-01 14:10:00", party_size: 5, user_id: u2.id, restaurant_id: r1.id)
Reservation.create!(date: "2018-08-26", time: "2000-01-01 14:10:00", party_size: 5, user_id: u2.id, restaurant_id: r2.id)
Reservation.create!(date: "2018-08-26", time: "2000-01-01 14:10:00", party_size: 5, user_id: u2.id, restaurant_id: r3.id)
Reservation.create!(date: "2018-08-26", time: "2000-01-01 14:10:00", party_size: 5, user_id: u3.id, restaurant_id: r1.id)
Reservation.create!(date: "2018-08-26", time: "2000-01-01 14:10:00", party_size: 5, user_id: u3.id, restaurant_id: r2.id)
Reservation.create!(date: "2018-08-26", time: "2000-01-01 14:10:00", party_size: 5, user_id: u3.id, restaurant_id: r3.id)
