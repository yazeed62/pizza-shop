# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#Create restaurant

5.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address
  )
end

#Create pizzas
5.times do
  Pizza.create(
    name: Faker::Food.dish,
    ingredients: Faker::Food.description
  )
end

#Create restaurant_pizzas
Restaurant.all.each do |restaurant|
  rand(1..3).times do
    pizza = Pizza.all.sample
    RestaurantPizza.create(
      restaurant: restaurant,
      pizza: pizza,
      price: Faker::Number.between(from: 1, to: 30)
    )
  end
end
