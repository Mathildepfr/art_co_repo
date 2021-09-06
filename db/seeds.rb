# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Destroying all files.."
User.destroy_all
Venue.destroy_all
Collection.destroy_all
Artwork.destroy_all

puts "Creating new files..."
mathilde = User.create!(first_name: "Mathilde", last_name: "Peiffer",
  address: "Prahran, Melbourne", is_artist: true,
  email: "mathilde@hotmail.com", password: "password",
  photo_url: "https://avatars.githubusercontent.com/u/86634734?v=4"
)
alastair = User.create!(first_name: "Alastair", last_name: "Tooth",
  address: "Richmond, Melbourne", is_artist: true,
  email: "alastair@hotmail.com", password: "password",
  photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1626063803/dksd83emlffgx6g3ywbl.jpg"
)
jason = User.create!(first_name: "Jason", last_name: "Jun",
  address: "St Kilda, Melbourne", is_artist: true,
  email: "jason@hotmail.com", password: "password",
  photo_url: "https://avatars.githubusercontent.com/u/5119591?v=4v"
)
charlie = User.create!(first_name: "Charlie", last_name: "Song",
  address: "Fitzroy, Melbourne", is_artist: false,
  email: "charlie@hotmail.com", password: "password",
  photo_url: "https://avatars.githubusercontent.com/u/65821608?v=4"
)
george = User.create!(first_name: "George", last_name: "Kettle",
  address: "Darlinghurst, Sydney", is_artist: false,
  email: "george@hotmail.com", password: "password",
  photo_url: "https://avatars.githubusercontent.com/u/34521157?v=4"
)

coolgallery = Venue.new(name: "Cool Gallery", address: "Fitzroy, Melbourne", type_of_venue: "Gallery", venue_url: "www.coolgallery.com")
coolgallery.user = charlie
coolgallery.save

farmrestaurant = Venue.new(name: "Farm Co", address: "Darlinghurst, Sydney", type_of_venue: "Restaurant", venue_url: "www.farmrestaurant.com")
farmrestaurant.user = george
farmrestaurant.save

emotions = Collection.new(title: "Emotions")
emotions.user = mathilde
emotions.save!

sadpainting = Artwork.new(title: "Sad painting", description: "The ocean is crying",
  price: 450, size: "440x560", available: true,
  medium: "Painting", style: "Modern",
  photo_url: "https://thefader-res.cloudinary.com/private_images/w_760,c_limit,f_auto,q_auto:best/C6f6FniU4AAI17Y_nzjutr/lorde-explain-every-song-on-melodrama-frank-ocean-the-louvre.jpg"
)
sadpainting.collection = emotions
sadpainting.save

musicheals = Artwork.new(title: "Music heals", description: "Listen to my music",
  price: 650, size: "640x560", available: true,
  medium: "Painting", style: "Modern",
  photo_url: "https://m.media-amazon.com/images/I/81WnYOt-mXL._SL1327_.jpg"
)
musicheals.collection = emotions
musicheals.save

latenight = Artwork.new(title: "Late night", description: "It's late in New-York City and it's raining",
  price: 900, size: "700x560", available: true,
  medium: "Painting", style: "Modern",
  photo_url: "https://afremov.com/var/images/product/1200.1200/GUITARIST.jpg"
)
latenight.collection = emotions
latenight.save

goingcrazy = Collection.new(title: "Going Crazy")
goingcrazy.user = alastair
goingcrazy.save!

cuttingmyear = Artwork.new(title: "Cutting my ear off", description: "Someone already did that I think",
  price: 3600, size: "600x433", available: true,
  medium: "Sculpture", style: "Contemporain",
  photo_url: "https://i.pinimg.com/236x/e6/83/7d/e6837d51f4a3aeb804c24166df869ced--ear-anatomy-human-anatomy.jpg"
)
cuttingmyear.collection = goingcrazy
cuttingmyear.save

lookeye = Artwork.new(title: "Look me in in eye", description: "Look at me !",
  price: 6000, size: "200x200", available: true,
  medium: "Sculpture", style: "Contemporain",
  photo_url: "https://images-cdn.auctionmobility.com/is3/auctionmobility-static/cSIJ-1-5VHRP//286_1.jpg?maxwidth=1000&maxheight=1000"
)
lookeye.collection = goingcrazy
lookeye.save

lookeye = Artwork.new(title: "See my lips", description: "Listen to me please",
  price: 8700, size: "300x200", available: true,
  medium: "Sculpture", style: "Contemporain",
  photo_url: "data:image/jpeg;base64,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"
)
lookeye.collection = goingcrazy
lookeye.save

calming = Collection.new(title: "Calming")
calming.user = jason
calming.save!

listentotheocean = Artwork.new(title: "Listen to the Ocean", description: "Nothing else calms me",
  price: 2000, size: "450x500", available: true,
  medium: "Painting", style: "Classic",
  photo_url: "https://img.artpal.com/701081/8-20-7-8-14-57-44m.jpg"
)
listentotheocean.collection = calming
listentotheocean.save

calmmorning = Artwork.new(title: "Calm morning", description: "Oil and ocean",
  price: 2500, size: "600x800", available: true,
  medium: "Painting", style: "Classic",
  photo_url: "https://i.pinimg.com/originals/8a/dc/df/8adcdfd2ccc89a521a8e9f89dd549040.jpg"
)
calmmorning.collection = calming
calmmorning.save

cliffmorning = Artwork.new(title: "The cliff is waking up", description: "Calm morning on the beach",
  price: 1990, size: "600x800", available: true,
  medium: "Painting", style: "Classic",
  photo_url: "https://ae01.alicdn.com/kf/HTB1jM7EJVXXXXbtXXXXq6xXFXXXU/The-Cliff-Etretat-Sunset-Claude-Famous-Oil-Paintings-Reproduction-Artwork-Classic-Seascape-Sea-Beach-Pictures-on.jpg"
)
cliffmorning.collection = calming
cliffmorning.save


puts "Finished"
