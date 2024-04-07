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
PageContent.destroy_all


# Create an admin user for Active Admin
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') unless AdminUser.find_by(email: 'admin@example.com')

# Seed a normal user account
User.create!(
  username: 'testuser',
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password'
) unless User.find_by(email: 'user@example.com')

# Setup About and Contact page
PageContent.create(title: 'About Us', content: 'Welcome to DogsLife, the ultimate haven for canine lovers and those looking to find a new furry friend to bring home. Established in 2018, DogsLife has been at the forefront of connecting dogs in need of a loving home with families and individuals who are ready to open their hearts to a new companion.

With a passionate team of over 40 professionals from around the globe, we specialize in professional foster dog care and have successfully placed countless dogs into loving homes. At DogsLife, we believe that every dog deserves a second chance, and our mission is to provide them with the opportunity to live the life they deserve.

Our platform offers a wide variety of dog breeds, ensuring that you find the perfect match for your lifestyle and preferences. From energetic puppies to calm and mature companions, our comprehensive list includes dogs of all sizes and personalities. Our expert team provides free consultations to help you find a dog that suits your environment, ensuring a seamless integration into your family.

At DogsLife, we are more than just an adoption service; we are a community of dog enthusiasts dedicated to making a difference in the lives of these wonderful animals. Join us on this rewarding journey and find your perfect canine companion today!', page_type: 'about')

PageContent.create(title: 'Contact Us', content: 'For any inquiries or assistance with the adoption process, feel free to contact us. Our team is available to answer your questions and provide the support you need. Reach out to us at +1 234 567 890, contact@dogslife.com, or visit us at 123 DogsLife Lane, Petville, PV 6789. Our office hours are 9:00 AM to 5:00 PM, Monday to Friday. We are closed on weekends and public holidays. You can also fill in our contact form on our website, and we will get back to you promptly.

Thank you for choosing DogsLife. We look forward to helping you find your new best friend!', page_type: 'contact')


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
