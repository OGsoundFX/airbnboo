require 'open-uri'

# USER
casper = User.create!(full_name: 'Casper Ghost', email: 'casper@gmail.com', password: '123456')

# PHOTOS OF HAUNTED HOUSES
photos = [
  'https://images.unsplash.com/photo-1581190634486-d06844301c77?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1563841623392-020439626029?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1964&q=80',
  'https://images.unsplash.com/photo-1559109942-5a736f5be373?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1964&q=80',
  'https://q-cf.bstatic.com/images/hotel/max1280x900/105/105084813.jpg',
  'https://images.unsplash.com/photo-1572455658253-7e14e62862a3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1560298379-40e8c327303c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1558934139-0f771227f2df?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1542071519-65d063713e4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
  'https://steemitimages.com/p/3HaJVvr6qfoEFgBir1jy4DeK1wwhDm7oNHzc1b8roaJY8MKXnCqTm4zbxZaMuQVsYdEDw7Gq2DMq5HWJdnPnyoADVgD7m3M5YrshjD8?format=match&mode=fit',
  'https://images.unsplash.com/photo-1555695928-fa3d22667032?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1548086488-5a19ce109d16?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1569346455366-6baef80e5535?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80',
]

# PROPERTIES
properties = [
  {
    name: 'Hollywood Tower',
    address: 'Rudi-Dutschke-Strasse 36, Berlin',
    price: 200,
    haunted_level: 1,
    user: casper,
  },
  {
    name: 'Ghost Cottage',
    address: 'Torstrasse 109, Berlin',
    price: 136,
    haunted_level: 3,
    user: casper,
  },
  {
    name: 'House of Torment',
    address: 'Witebska 2-1, Zielona Góra',
    price: 245,
    haunted_level: 5,
    user: casper,
  },
  {
    name: 'Stanley Hotel',
    address: 'Carl-von-Ossietzky-Straße 18, Potsdam',
    price: 360,
    haunted_level: 5,
    user: casper,
  },
  {
    name: 'Hotel Gertrud',
    address: 'Lindenallee 25, Stralsund',
    price: 250,
    haunted_level: 3,
    user: casper,
  },
  {
    name: 'Alte Scheune',
    address: 'Hermannstrasse 28, Berlin',
    price: 245,
    haunted_level: 5,
    user: casper,
  },
  {
    name: 'Jeepers Creepers',
    address: 'Wörlitzer Str. 16-22, Berlin',
    price: 270,
    haunted_level: 4,
    user: casper,
  },
  {
    name: 'Adams Mansion',
    address: 'Am Kietzer Feld, Berlin',
    price: 362,
    haunted_level: 5,
    user: casper,
  },
  {
    name: 'Bloody Inn',
    address: 'Modersohnstrasse 30, Berlin',
    price: 175,
    haunted_level: 3,
    user: casper,
  },
  {
    name: 'Die Goldene Traube',
    address: 'Am Viktoriabrunnen 2, Coburg',
    price: 180,
    haunted_level: 4,
    user: casper,
  },
  {
    name: 'Scary Mansion',
    address: 'Genslerstraße 84, Berlin',
    price: 200,
    haunted_level: 1,
    user: casper,
  },
  {
    name: 'Der Hirsch',
    address: 'Waßmannsdorfer Chaussee 35',
    price: 150,
    haunted_level: 3,
    user: casper,
  },
]

puts "-- Generating haunted houses"

# CREATING PROPERTIES WITH ATTRIBUTES
properties.each_with_index do |property, index|
  puts "-- 👻 Haunting #{property[:address]}\n"
  prop = Property.new(property)
  prop.photo.attach(io: URI.open(photos[index]), filename: 'photo.jpg')
  prop.save!
end

puts "-- Haunted houses are ready!👻"
