# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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
Dog.create!([
  {
    name: "Buddy",
    breed: "Golden Retriever",
    story: "A friendly and energetic dog looking for a loving home.",
    photo_url: "https://example.com/photos/buddy.jpg",
    available_for_adoption: true
  },
  {
    name: "Lucy",
    breed: "Labrador",
    story: "Gentle and affectionate, great with kids and other pets.",
    photo_url: "https://example.com/photos/lucy.jpg",
    available_for_adoption: true
  },
  {
    name: "Max",
    breed: "German Shepherd",
    story: "Loyal and intelligent, well-trained and eager to please.",
    photo_url: "https://example.com/photos/max.jpg",
    available_for_adoption: true
  }
])
