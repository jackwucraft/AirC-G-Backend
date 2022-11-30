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
    description: "#{name} is a 2017 action-adventure game developed and published by Nintendo for the Nintendo Switch and Wii U consoles. The game is an installment of The Legend of Zelda series and is set at the end of its timeline. The player controls an amnesiac Link, who awakens from a hundred-year slumber, and attempts to regain his memories and prevent the destruction of Hyrule by Calamity Ganon.",
    platform: ["xbox", "ps5", "switch"].sample,
    picture_url: "https://loremflickr.com/320/240/console",
    price_per_day: rand(1..10)
  )
end
puts "#{Game.all.length} games loaded."
