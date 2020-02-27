# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Property.destroy_all
# User.destroy_all
casper = User.create!(full_name: 'Casper Ghost', email: 'casper@gmail.com', password: '123456')

puts "generating hauted houses"
Property.create!(name: "Bates Motel", address: "Rudi-Dutschke-Strasse 36, Berlin" ,price: 200, haunted_level: 5, user_id: casper.id)
Property.create!(name: "Ghost Cottage", address: "Potsdamerplatz 10, Berlin" ,price: 200, haunted_level: 4, user_id: casper.id)
Property.create!(name: "The creeps", address: "Zittauer Str. 63-55, 12355 Berlin" ,price: 200, haunted_level: 5, user_id: casper.id)
Property.create!(name: "Haunted hotel", address: " Birkbuschstraße 36, 12167 Berlin" ,price: 200, haunted_level: 2, user_id: casper.id)
Property.create!(name: "Scary Mansion", address: "18 Rue de Paradis, 75010 Paris, France",price: 200, haunted_level: 1, user_id: casper.id)
puts "hauted houses are ready!👻"

