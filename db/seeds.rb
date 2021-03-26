require 'faker'

puts "Creating"
25.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 120),
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    role: "Owner",
    password: "Adminzoo",
    )
    user.save!
end
puts "Created 25 Fake users"
puts "Creating animals"
  75.times do
    animal = Animal.new(
      name: Faker::Name.name,
      description: Faker::Lorem.paragraph,
      category: "Dog",
      sex: Faker::Gender.binary_type,
      user_id: Faker::Number.between(from: 1, to: 25),
      age: Faker::Number.between(from: 1, to: 80),
      personality_attributes: "cool"
    )
    animal.save!
  end
puts "Done!"