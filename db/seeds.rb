# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying all the games!!"
Game.destroy_all

puts "Creating 20 random games!"
puts "loading games..."
20.times do
  Game.create(
    name: Faker::Game.title,
    description: Faker::Game.genre,
    platform: ["xbox", "ps5", "switch"].sample,
    picture_url: "https://loremflickr.com/320/240/console",
    price_per_day: rand(1..10)
  )
end
puts "#{Game.all.length} games loaded."
