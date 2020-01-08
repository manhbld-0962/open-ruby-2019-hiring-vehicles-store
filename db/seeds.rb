# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "admin", email: "admin@gmail.com", 
            password: "123456", password_confirmation: "123456",
            admin: true)
Category.create(name: "Car")
Branch.create!(name: Faker::Address.city)
Branch.create!(name: Faker::Address.city)
50.times do 
  name = Faker::Vehicle.make_and_model
  des = Faker::Lorem.sentence(word_count: 25)
  Vehicle.create!(name: name, quantity: 10, category_id: 1, branch_id: 1, description: des, price: 200000 )
end

50.times do 
  name = Faker::Vehicle.make_and_model
  des = Faker::Lorem.sentence(word_count: 25)
  Vehicle.create!(name: name, quantity: 10, category_id: 1, branch_id: 2, description: des, price: 200000 )
end

100.times do 
  vehicle_ids = Vehicle.pluck(:id)
  vehicle_id = vehicle_ids.sample
  time = rand(1..12)
  Hiring.create!(user_id: 1, vehicle_id: vehicle_id, created_at: time.months.ago, time: 3 )
end
