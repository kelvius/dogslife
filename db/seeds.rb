# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Destroy lists
Dog.destroy_all
AdminUser.destroy_all
User.destroy_all

# Create an admin user for Active Admin
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') unless AdminUser.find_by(email: 'admin@example.com')

# Seed a normal user account
User.create!(
  username: 'testuser',
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password'
) unless User.find_by(email: 'user@example.com')

# Seed some dogs
# Dog.create!([
#   {
#     name: "Buddy",
#     breed: "Golden Retriever",
#     story: "A friendly and energetic dog looking for a loving home.",
#     photo_url: "https://example.com/photos/buddy.jpg",
#     available_for_adoption: true
#   },
#   {
#     name: "Lucy",
#     breed: "Labrador",
#     story: "Gentle and affectionate, great with kids and other pets.",
#     photo_url: "https://example.com/photos/lucy.jpg",
#     available_for_adoption: true
#   },
#   {
#     name: "Max",
#     breed: "German Shepherd",
#     story: "Loyal and intelligent, well-trained and eager to please.",
#     photo_url: "https://example.com/photos/max.jpg",
#     available_for_adoption: true
#   }
# ])

# Define the dog types/categories
dog_types = ["Service", "Companion", "Guard", "Herding"]

# Define some sample breeds, stories, and image URLs
breeds = ["Golden Retriever", "Labrador", "German Shepherd", "Bulldog", "Poodle", "Beagle", "Rottweiler", "Boxer", "Dachshund", "Siberian Husky"]
stories = [
  "A friendly and energetic dog looking for a loving home.",
  "Gentle and affectionate, great with kids and other pets.",
  "Loyal and intelligent, well-trained and eager to please.",
  "Loves to play and cuddle, perfect for any family.",
  "Strong and courageous, excellent guard dog."
]
photo_urls = [
  "https://example.com/photos/dog1.jpg",
  "https://example.com/photos/dog2.jpg",
  "https://example.com/photos/dog3.jpg",
  "https://example.com/photos/dog4.jpg",
  "https://example.com/photos/dog5.jpg"
]

# Seed 50 random dogs
50.times do
  Dog.create!(
    name: Faker::Creature::Dog.name,
    breed: breeds.sample,
    story: stories.sample,
    photo_url: photo_urls.sample,
    available_for_adoption: [true, false].sample,
    dog_type: dog_types.sample  # Ensure your Dog model has a `dog_type` attribute
  )
end
