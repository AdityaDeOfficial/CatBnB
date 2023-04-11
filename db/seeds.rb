# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  cat = Cat.new(
    name: Faker::Creature::Cat.name,
    user_id: 1,
    gender: Faker::Creature::Dog.gender,
    age: Faker::Creature::Dog.age,
    breed: Faker::Creature::Cat.breed,
    microchip_number: Faker::Number.number(digits: 10),
    photo_url: "https://loremflickr.com/640/480/cats",
    address: Faker::Address.city,
    color: Faker::Color.color_name,
    temperament: ["happy", "sad"].sample,
    description: Faker::Creature::Cat.registry
  )
  cat.save!
end
puts "10 cats added~!"
