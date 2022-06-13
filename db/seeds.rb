# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Contact.destroy_all
Group.destroy_all
User.destroy_all

user_ids = []
user_ids << User.create(name: "Tim Holand",email: "dev01@example.com",password: "123456").id
user_ids << User.create(name: "Tom Ford",email: "dev02@example.com",password: "123456").id

p "created #{user_ids.count} group"

group_ids = { user_ids[0] => [], user_ids[1] => []}
group_ids[user_ids[0]] <<  Group.create(name: "Family",user_id: user_ids[0]).id
group_ids[user_ids[0]] <<  Group.create(name: "Friend",user_id: user_ids[0]).id
group_ids[user_ids[1]] <<  Group.create(name: "Client",user_id: user_ids[1]).id
group_ids[user_ids[1]] <<  Group.create(name: "Company",user_id: user_ids[1]).id

p "created #{group_ids.count} group "

group_count = group_ids.count
number_of_contacts = 60
contacts = []

number_of_contacts.times do |n|
  user_id = user_ids[Random.rand(0...user_ids.count)]
  new_concact = {
    name: Faker::Name.name,
    company: Faker::Company.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    address: "#{Faker::Address.street_address} #{Faker::Address.zip} #{Faker::Address.city}",
    group_id: group_ids[user_id][Random.rand(0...group_count)],
    user_id: user_id
  }
  contacts.push(new_concact)
end

Contact.create(contacts)

p "created #{contacts.count} contacts"
