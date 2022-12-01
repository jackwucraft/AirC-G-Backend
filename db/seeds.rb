# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying all the games!!"
Like.destroy_all
Game.destroy_all
Booking.destroy_all
User.destroy_all

puts "Creating some random games!"
puts "loading games..."
games1 = []
new_user1 = User.new(nickname: Faker::Internet.username)
rand(2..5).times do
  platformeg = [
    { platform: "xbox", picture_url: "https://images.unsplash.com/photo-1605901309584-818e25960a8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3119&q=80"},
    { platform: "ps5", picture_url: "https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"},
    { platform: "switch", picture_url: "https://images.unsplash.com/photo-1585427795543-33cf23ea2853?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"}
  ].sample
  name = Faker::Game.title
  games1 << Game.new(
    name:,
    description: "#{name} is a 2017 action-adventure game developed and published by Nintendo for the Nintendo Switch and Wii U consoles. The game is an installment of The Legend of Zelda series and is set at the end of its timeline. The player controls an amnesiac Link, who awakens from a hundred-year slumber, and attempts to regain his memories and prevent the destruction of Hyrule by Calamity Ganon.",
    platform: platformeg[:platform],
    picture_url: platformeg[:picture_url],
    price_per_day: rand(1..10)
  )
end
new_user1.games = games1
5.times do
  games = []
  new_user = User.new(nickname: Faker::Internet.username)
  rand(2..5).times do
    platformeg = [
      { platform: "xbox", picture_url: "https://images.unsplash.com/photo-1605901309584-818e25960a8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3119&q=80"},
      { platform: "ps5", picture_url: "https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"},
      { platform: "switch", picture_url: "https://images.unsplash.com/photo-1585427795543-33cf23ea2853?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"}
    ].sample
    name = Faker::Game.title
    games << Game.new(
      name:,
      description: "#{name} is a 2017 action-adventure game developed and published by Nintendo for the Nintendo Switch and Wii U consoles. The game is an installment of The Legend of Zelda series and is set at the end of its timeline. The player controls an amnesiac Link, who awakens from a hundred-year slumber, and attempts to regain his memories and prevent the destruction of Hyrule by Calamity Ganon.",
      platform: platformeg[:platform],
      picture_url: platformeg[:picture_url],
      price_per_day: rand(1..10)
    )
  end
  new_user.games = games
  new_user.save
end
index = 6
rand(2..5).times do
  new_like = Like.new
  new_like.game = Game.find(index)
  new_like.user = new_user1
  new_like.save
  index += 1
end
new_user1.save

puts "#{Game.all.length} games loaded."
puts "#{User.all.length} Users loaded."
games_liked_by_user = User.find(6).likes.each(&:game)
puts "#{games_liked_by_user.length} games in likes loaded."
