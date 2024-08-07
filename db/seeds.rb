# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Creating Restaurants!!!"

Restaurant.destroy_all

20.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORY.sample,
  )
end

puts "#{Restaurant.count} restaurants created!"

puts "Creating Reviews!!!"

Restaurant.all.each do |restaurant|
  [1,2,3].sample.times do
    Review.create!(
      content: Faker::Restaurant.review,
      rating: [0,1,2,3,4,5].sample,
      restaurant: restaurant,
    )
  end
end

puts "#{Review.count} reviews created!"
