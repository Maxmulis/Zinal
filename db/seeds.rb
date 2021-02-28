# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

# {"gender"=>"female",
#  "name"=>{"title"=>"Mrs", "first"=>"Holly", "last"=>"Peters"},
#  "location"=>
#   {"street"=>{"number"=>9162, "name"=>"Mill Lane"},
#    "city"=>"Roscrea",
#    "state"=>"Kilkenny",
#    "country"=>"Ireland",
#    "postcode"=>75914,
#    "coordinates"=>{"latitude"=>"23.4447", "longitude"=>"-28.0160"},
#    "timezone"=>{"offset"=>"+8:00", "description"=>"Beijing, Perth, Singapore, Hong Kong"}},
#  "email"=>"holly.peters@example.com",
#  "login"=>
#   {"uuid"=>"ee0586e0-d57a-4016-8a43-6838255a9412",
#    "username"=>"ticklishswan556",
#    "password"=>"alan",
#    "salt"=>"2nIosp1A",
#    "md5"=>"77145bbedc18954b4d9d03558dc54e88",
#    "sha1"=>"c630f893b697e90eac0695c8a2e9384192b765b6",
#    "sha256"=>"9d50058e80e0227302cd27c46b0973fb15d25d45ed080a3ac699dcc294f634ff"},
#  "dob"=>{"date"=>"1977-01-31T19:24:09.012Z", "age"=>44},
#  "registered"=>{"date"=>"2015-09-22T22:09:55.665Z", "age"=>6},
#  "phone"=>"011-310-6241",
#  "cell"=>"081-547-2630",
#  "id"=>{"name"=>"PPS", "value"=>"5275617T"},
#  "picture"=>
#   {"large"=>"https://randomuser.me/api/portraits/women/35.jpg",
#    "medium"=>"https://randomuser.me/api/portraits/med/women/35.jpg",
#    "thumbnail"=>"https://randomuser.me/api/portraits/thumb/women/35.jpg"},
#  "nat"=>"IE"}

URL = 'https://randomuser.me/api/?results='
people_amount = 120
group_amount = 30
people_json = HTTParty.get(URL + people_amount.to_s)
PEOPLE = JSON.parse(people_json.body)


Person.destroy_all
Group.destroy_all

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
    country: person['location']['country']
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

