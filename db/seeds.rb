# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Person.destroy_all
Group.destroy_all

5.times do
  puts "Creating a group"
  group = Group.create(
    name: Faker::Name.last_name,
    street: Faker::Address.street_name,
    number: (0..100).to_a.sample.to_s,
    zip: Faker::Address.postcode,
    town: "Basel",
    country: "Schweiz"
    )

  puts "Group #{group.name} created."

  min_date = Time.now - 90.years
  max_date = Time.now - 1.year

  i = (1..7).to_a.sample
  puts "Creating #{i} people and adding them to #{group.name} "
  i.times do

    person = Person.new(firstname: Faker::Name.first_name,
      birthdate: rand(min_date..max_date).to_date,
      phone: Faker::PhoneNumber.phone_number,
      comment: Faker::Quote.yoda)

    person.group = group
    puts "#{person.firstname} saved to #{group.name}!" if person.save
  end
end

