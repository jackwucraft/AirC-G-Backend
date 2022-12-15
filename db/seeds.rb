# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying all the products!!"
Like.destroy_all
Product.destroy_all
Booking.destroy_all
User.destroy_all

puts "Creating some random products!"
puts "loading products..."
products1 = []
new_user1 = User.new(nickname: Faker::Internet.username)
rand(2..5).times do
  name = Faker::Game.title
  products1 << Product.new(
    name:,
    description: "#{name} is a 2017 action-adventure product developed and published by Nintendo for the Nintendo Switch and Wii U consoles. The product is an installment of The Legend of Zelda series and is set at the end of its timeline. The player controls an amnesiac Link, who awakens from a hundred-year slumber, and attempts to regain his memories and prevent the destruction of Hyrule by Calamity Ganon.",
    platform: ["xbox", "ps5", "switch"].sample,
    picture_url: "https://airgandc.oss-cn-shanghai.aliyuncs.com/images/game-#{rand(1..12)}.jpg",
    price_per_day: rand(1..10),
    sort: "game"
  )
end
new_user1.products = products1
5.times do
  products = []
  new_user = User.new(nickname: Faker::Internet.username)
  rand(2..5).times do
    name = Faker::Game.title
    products << Product.new(
      name:,
      description: "#{name} is a 2017 action-adventure product developed and published by Nintendo for the Nintendo Switch and Wii U consoles. The product is an installment of The Legend of Zelda series and is set at the end of its timeline. The player controls an amnesiac Link, who awakens from a hundred-year slumber, and attempts to regain his memories and prevent the destruction of Hyrule by Calamity Ganon.",
      platform: ["xbox", "ps5", "switch"].sample,
      picture_url: "https://airgandc.oss-cn-shanghai.aliyuncs.com/images/game-#{rand(1..12)}.jpg",
      price_per_day: rand(1..10),
      sort: "game"
    )
  end
  new_user.products = products
  new_user.save
end
index = Product.all.sample.id
rand(1..3).times do
  new_like = Like.new
  new_like.product = Product.find(index)
  new_like.user = new_user1
  new_like.save
  index += 1
end
new_user1.save

puts "#{Product.all.length} products loaded."
puts "#{User.all.length} Users loaded."
products_liked_by_user = User.find(6).likes.each(&:product)
puts "#{products_liked_by_user.length} products in likes loaded."

# https://airgandc.oss-cn-shanghai.aliyuncs.com/images/game-9.jpg
# platformeg = [
#   { platform: "xbox", picture_url: "https://images.unsplash.com/photo-1605901309584-818e25960a8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3119&q=80"},
#   { platform: "ps5", picture_url: "https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"},
#   { platform: "switch", picture_url: "https://images.unsplash.com/photo-1585427795543-33cf23ea2853?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"}
# ].sample
