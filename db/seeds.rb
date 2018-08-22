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
User.create(first_name: "David", last_name: "Ma", username: "DMA", email: "dma@gmail.com", password: "123", password_confirmation: "123")
User.create(first_name: "Joey", last_name: "Saha", username: "JSA", email: "jsa@gmail.com", password: "123", password_confirmation: "123")
User.create(first_name: "Tyler", last_name: "Palef", username: "TPA", email: "tpa@gmail.com", password: "123", password_confirmation: "123")


Restaurant.create(name: "BK", opening_hour: "2000-01-01 08:30:00", closing_hour: "2000-01-01 11:30:00", max_capacity: 45, user_id: 1)
Restaurant.create(name: "McD", opening_hour: "2000-01-01 08:30:00", closing_hour: "2000-01-01 11:30:00", max_capacity: 35, user_id: 2)
Restaurant.create(name: "RL", opening_hour: "2000-01-01 08:30:00", closing_hour: "2000-01-01 11:30:00", max_capacity: 35, user_id: 1)


Reservation.create(date: "2018-08-25", time: "2000-01-01 15:10:00", party_size: 9, user_id: 1, restaurant_id: 1)
Reservation.create(date: "2018-08-25", time: "2000-01-01 15:10:00", party_size: 9, user_id: 1, restaurant_id: 2)
Reservation.create(date: "2018-08-25", time: "2000-01-01 15:10:00", party_size: 9, user_id: 1, restaurant_id: 3)
Reservation.create(date: "2018-08-26", time: "2000-01-01 14:10:00", party_size: 5, user_id: 2, restaurant_id: 1)
Reservation.create(date: "2018-08-26", time: "2000-01-01 14:10:00", party_size: 5, user_id: 2, restaurant_id: 2)
Reservation.create(date: "2018-08-26", time: "2000-01-01 14:10:00", party_size: 5, user_id: 2, restaurant_id: 3)
Reservation.create(date: "2018-08-26", time: "2000-01-01 14:10:00", party_size: 5, user_id: 3, restaurant_id: 1)
Reservation.create(date: "2018-08-26", time: "2000-01-01 14:10:00", party_size: 5, user_id: 3, restaurant_id: 2)
Reservation.create(date: "2018-08-26", time: "2000-01-01 14:10:00", party_size: 5, user_id: 3, restaurant_id: 3)
