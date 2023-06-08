# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning database...'
Trip.destroy_all

puts 'creating 2 trips...'

User.create(email: "ntm@gmail.com", password: "hello123", password_confirmation: "hello123")

Trip.create(destination: "Budapest", number_of_guests: 2, start_date: "2023-07-10", end_date: "2023-07-15")
Trip.create(destination: "Rome", number_of_guests: 4, start_date: "2023-08-05", end_date: "2023-08-10")

puts "creating activities...."
5.times do
  Activity.create(
    location: Faker::Address.city,
    activity_type: Faker::Address.community,
    name: Faker::Lorem.words(number: 2).join(' '),
    details: Faker::Lorem.paragraph,
    rating: rand(1..5),
    image_url: Faker::LoremFlickr.image,
    website_url: Faker::Internet.url,
    daytime: [true, false].sample
  )
end

puts 'finished!'
