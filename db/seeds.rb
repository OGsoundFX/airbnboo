require 'open-uri'

# USER
puts 'Deleting all properties'
Property.delete_all

puts 'Deleting all users'
User.delete_all

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
    description: "The Hollywood Tower has gained paranormal notoriety around the world, with some believing it to be a portal that causes visitors to disappear. Do you dare to visit?",
    user: casper,
  },
  {
    name: 'Ghost Cottage',
    address: 'Torstrasse 109, Berlin',
    price: 136,
    haunted_level: 3,
    description: "This is one of the creepiest cottages around Berlin. Who would believe, that a ghost-ridden cottage is on Torstrasse. Dare to pay a visit?",
    user: casper,
  },
  {
    name: 'House of Torment',
    address: 'Witebska 2-1, Zielona Góra',
    price: 245,
    haunted_level: 5,
    description: "The Calgary Herald has reported several resident ghosts, including a bride who supposedly fell down the stone staircase during her wedding.",
    user: casper,
  },
  {
    name: 'Stanley Hotel',
    address: 'Carl-von-Ossietzky-Straße 18, Potsdam',
    price: 360,
    haunted_level: 5,
    description: "The Stanley Hotel's stately Georgian architecture and world-renowned whiskey bar have lured travelers to Estes Park since opening in 1909, but the hotel reached new levels of fame after inspiring Stephen King to create the The Shining's fictional Overlook Hotel. That eerie association aside, many other ghost sightings and some mysterious piano music have been connected to the hotel, and the Stanley Hotel leans into its reputation with nightly ghost tours and psychic consultations from the in-house Madame Vera.",
    user: casper,
  },
  {
    name: 'Hotel Gertrud',
    address: 'Lindenallee 25, Stralsund',
    price: 250,
    haunted_level: 3,
    description: "Built in 1888 to encourage tourism and sell train tickets, this chateau-style hotel sits pretty by the coast of Stralsund. But it gets a tad more Gothic once you get inside—and we aren't talking about the architecture. It has been reported that several resident ghosts, including a bride who supposedly fell down the stone staircase during her wedding. But there’s a less tragic spirit, too: Sam the bellman, who worked at the hotel until 1975 and claimed he’d come back to haunt the joint. His spirit supposedly pulls shifts helping people with their bags before disappearing.",
    user: casper,
  },
  {
    name: 'Alte Scheune',
    address: 'Hermannstrasse 28, Berlin',
    price: 245,
    haunted_level: 5,
    description: "One of the creepiest Scheunes in Berlin. There is no guarantee you will exit alive. Dare to visit for a night of fear?",
    user: casper,
  },
  {
    name: 'Jeepers Creepers',
    address: 'Wörlitzer Str. 16-22, Berlin',
    price: 270,
    haunted_level: 4,
    description: "One of the tallest castles in all of Berlin, the seven-story castle de Jeepers Creepers is perhaps best known as the home of 'The Green Lady,' aka the ghost of Charlotte of Germany. The castle's website tells the legend of Charlotte, the illegitimate daughter of King Gustav X, who was murdered by her husband after he discovered her having an affair. Named for the color of her dress when she was killed, the Green Lady can be found roaming the chapel's tower room and moaning in the early hours of morning.",
    user: casper,
  },
  {
    name: 'Adams Mansion',
    address: 'Am Kietzer Feld, Berlin',
    price: 362,
    haunted_level: 5,
    description: "The estate was originally owned by a wealthy businessman who intended to give the property to his daughter as a wedding present. However, a mysterious duel between the groom and the best man left both men dead the day of the wedding, and the the daughter remained unmarried and alone for the rest of her life. Today, many visitors say they have seen the reclusive woman's spirit roaming throughout the estate.",
    user: casper,
  },
  {
    name: 'Bloody Inn',
    address: 'Modersohnstrasse 30, Berlin',
    price: 175,
    haunted_level: 3,
    description: "Built in 1145, Germany's Bloody Inn has played many roles over the centuries: a former priest's residence, housing for masons and slaves, an inn, and a public house. It also happens to be one seriously haunted spot. Architectural Digest writes: 'With ghostly children, a high priestess, and even an incubus wandering the halls, guests have reportedly leapt from the windows in a frenzy to escape.",
    user: casper,
  },
  {
    name: 'Die Goldene Traube',
    address: 'Am Viktoriabrunnen 2, Coburg',
    price: 180,
    haunted_level: 4,
    description: "Overlooking Coburg's waterfront, the Goldene Traube is most famous for hosting a meeting between Ronald Regan and Michael Gorbachev in 1986, a historic moment during the end of the Cold War. The house has housed many other famous figures over the years, including Queen Elizabeth, Winston Churchill, and Marlene Dietrich, plus a handful of British ambassadors. It was one such ambassador who first experienced 'The White Lady', a ghost who many believe to be a victim of suicide. The phantom lady apparently caused so much panic and distress, the ambassador persuaded the British Foreign office to sell the house immediately.",
    user: casper,
  },
  {
    name: 'Scary Mansion',
    address: 'Genslerstraße 84, Berlin',
    price: 200,
    haunted_level: 1,
    description: "During renovations in the early 1900s, workmen found a secret dungeon in the Scary Mansion with so many human skeletons, they filled three cartloads when hauled away. The dungeon was designed so that prisoners would fall through a trap door, have their lungs punctured by wooden spikes on the ground, and die a slow, horrific death within earshot of the sinister clan members above.",
    user: casper,
  },
  {
    name: 'Der Hirsch',
    address: 'Waßmannsdorfer Chaussee 35',
    price: 150,
    haunted_level: 3,
    description: "Ghosts are said to haunt Der Hirsch, where almost 600 people perished after a fire famously broke out in 1903. Even though the building was completely rebuilt and rebranded, spirits of the dead remained: apparitions have been seen in 'Death Alley', the street behind the theater where bodies were stacked after the disaster.",
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
