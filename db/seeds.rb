# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
restaurants_number = 10
ratings_max_rand_number = 15
categories = ["chinese", "italian", "japanese", "french", "belgian"]

puts "Cleaning database..."
Restaurant.destroy_all

puts "\n\n" + "*" * 50 + "\n\n"

puts "Creating restaurants..."
restaurants_number.times do
  faker_restaurant = {
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: categories.sample
  }
  restaurant = Restaurant.new(faker_restaurant)
  restaurant.save
  puts "Created #{restaurant.name}"

  puts "\n\n" + "*" * 30 + "\n\n"

  ratingsnum = rand(1..ratings_max_rand_number)

  puts "Populating with #{ratingsnum} reviews.\n\n"
  ratingsnum.times do
    faker_review = {
      rating: rand(0..5),
      content: Faker::Restaurant.review
    }
    review = Review.new(faker_review)
    review.restaurant = restaurant
    review.save
    puts "----- #{review.content}.\n\n"
  end

  puts "\n\n" + "*" * 30 + "\n\n"

end

puts "Finished!"