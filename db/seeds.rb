

URL = 'https://randomuser.me/api/?results='
people_amount = 8
group_amount = 3
people_json = HTTParty.get(URL + people_amount.to_s)
PEOPLE = JSON.parse(people_json.body)


Group.destroy_all
Person.destroy_all
User.destroy_all

User.create(email: 'test@zinal.ch', password: 'zinal2021')

puts "Creating #{group_amount.to_s} groups"

group_amount.times do
  puts "Creating a group"
  person = PEOPLE['results'].sample
  group = Group.new(
    name: person['name']['last'],
    street: person['location']['street']['name'],
    number: person['location']['street']['number'],
    zip: person['location']['postcode'],
    town: person['location']['city'],
    country: ['DE', 'CH', 'CH', 'CH', 'CH'].sample
    )

  puts "Group #{group.name} created." if group.save

end

puts "Successfully created #{group_amount.to_s} groups!"

groups = Group.all

PEOPLE['results'].each do |person_hash|
  firstname = person_hash['name']['first']
  person = Person.new(firstname: firstname,
                      birthdate: Date.rfc3339(person_hash['dob']['date'])
                      )

  file = URI.open(person_hash['picture']['large'])
  person.photo.attach(io: file,
              filename: "avatar-#{person.id.to_s}",
                      )

  person.group = groups.sample
  puts "Added #{person.firstname} #{person.group.name}, aged #{person.age.to_s} " if person.save
end


puts "Done!"

