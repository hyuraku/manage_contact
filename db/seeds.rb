# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Contact.destroy_all
Group.destroy_all

group_ids = []

group_ids <<  Group.create(name: "family").id
group_ids <<  Group.create(name: "friend").id
group_ids <<  Group.create(name: "client").id

p "created #{group_ids.count} group "

group_count = group_ids.count
number_of_contacts = 20
contacts = []

number_of_contacts.times do |n|
  new_concact = {
    name: Faker::Name.name,
    company: Faker::Company.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    address: "#{Faker::Address.street_address} #{Faker::Address.zip} #{Faker::Address.city}",
    group_id: group_ids[Random.rand(0...group_count)]
  }
  contacts.push(new_concact)
end

Contact.create(contacts)

p "created #{contacts.count} contacts"
