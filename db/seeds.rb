# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

def attach_photo(object, url)
  file = URI.open(url)
  object.photo.attach(io: file, filename: 'photo', content_type: 'image/png')
end

# file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
# article = Article.new(title: 'NES', body: "A great console")
# article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts "Destroying all files.."

Venue.destroy_all
Collection.destroy_all
Artwork.destroy_all
User.destroy_all


puts "Creating new files..."
mathilde = User.create!(first_name: "Mathilde", last_name: "Peiffer",
  address: "Prahran, Melbourne", is_artist: true,
  email: "mathilde@hotmail.com", password: "password")
attach_photo(mathilde, "https://avatars.githubusercontent.com/u/86634734?v=4")

alastair = User.create!(first_name: "Alastair", last_name: "Tooth",
  address: "Richmond, Melbourne", is_artist: true,
  email: "alastair@hotmail.com", password: "password")
attach_photo(alastair, "https://avatars.githubusercontent.com/u/63182043?v=4")

jason = User.create!(first_name: "Jason", last_name: "Jun",
  address: "St Kilda, Melbourne", is_artist: true,
  email: "jason@hotmail.com", password: "password")
attach_photo(jason, "https://avatars.githubusercontent.com/u/5119591?v=4v")

charlie = User.create!(first_name: "Charlie", last_name: "Song",
  address: "Fitzroy, Melbourne", is_artist: false,
  email: "charlie@hotmail.com", password: "password")
attach_photo(charlie, "https://avatars.githubusercontent.com/u/65821608?v=4")

george = User.create!(first_name: "George", last_name: "Kettle",
  address: "Darlinghurst, Sydney", is_artist: false,
  email: "george@hotmail.com", password: "password")
attach_photo(george, "https://avatars.githubusercontent.com/u/34521157?v=4")

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
  price: 450, size: "440x560", available: true)
attach_photo(sadpainting, "https://res.cloudinary.com/mathildepfr/image/upload/v1631065212/lorde-explain-every-song-on-melodrama-frank-ocean-the-louvre_k2sjr8.jpg")
sadpainting.collection = emotions
sadpainting.save

musicheals = Artwork.new(title: "Music heals", description: "Listen to my music",
  price: 650, size: "640x560", available: true)
attach_photo(musicheals, "https://m.media-amazon.com/images/I/81WnYOt-mXL._SL1327_.jpg")
musicheals.collection = emotions
musicheals.save

latenight = Artwork.new(title: "Late night", description: "It's late in New-York City and it's raining",
  price: 900, size: "700x560", available: true)
attach_photo(latenight, "https://afremov.com/var/images/product/1200.1200/GUITARIST.jpg")
latenight.collection = emotions
latenight.save

happiness = Collection.new(title: "Happiness")
happiness.user = mathilde
happiness.save!

flames = Artwork.new(title: "Flames of Happiness", description: "Its burning with happiness outside",
  price: 2900, size: "300x800", available: true)
attach_photo(flames, "https://afremov.com/images/product/image_1301.jpeg")
flames.collection = happiness
flames.save

love = Artwork.new(title: "Love under the rain", description: "Its raining but who cares",
  price: 3500, size: "400x800", available: true)
attach_photo(love, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMiBd_XydsIpizQbl9nMmomiTxI4YwBgfWRQ&usqp=CAU")
love.collection = happiness
love.save

kissrain = Artwork.new(title: "Kiss under the rain", description: "Its raining but who cares",
  price: 2800, size: "500x800", available: true)
attach_photo(kissrain, "https://m.media-amazon.com/images/I/812eVUYv8XL._SL1386_.jpg")
kissrain.collection = happiness
kissrain.save

goingcrazy = Collection.new(title: "Going Crazy")
goingcrazy.user = alastair
goingcrazy.save!

cuttingmyear = Artwork.new(title: "Cutting my ear off", description: "Someone already did that I think",
  price: 3600, size: "600x433", available: true)
attach_photo(cuttingmyear, "https://media.istockphoto.com/photos/white-ear-picture-id475488829?k=20&m=475488829&s=612x612&w=0&h=u18RK_TRfS3xSCf5nKB2yft-EGyjPYXdhTjCOBfNlU0=")
cuttingmyear.collection = goingcrazy
cuttingmyear.save

lookeye = Artwork.new(title: "Look me in in eye", description: "Look at me !",
  price: 6000, size: "200x200", available: true)
attach_photo(lookeye, "https://images-cdn.auctionmobility.com/is3/auctionmobility-static/cSIJ-1-5VHRP//286_1.jpg?maxwidth=1000&maxheight=1000")
lookeye.collection = goingcrazy
lookeye.save

seelips = Artwork.new(title: "See my lips", description: "Listen to me please",
  price: 8700, size: "300x200", available: true)
attach_photo(seelips, "https://res.cloudinary.com/mathildepfr/image/upload/v1631066485/HD-wallpaper-bacio-graphy-white-abstract-sculpture_anjrct.jpg")
seelips.collection = goingcrazy
seelips.save

calming = Collection.new(title: "Calming")
calming.user = jason
calming.save!

listentotheocean = Artwork.new(title: "Listen to the Ocean", description: "Nothing else calms me",
  price: 2000, size: "450x500", available: true)
attach_photo(listentotheocean, "https://img.artpal.com/701081/8-20-7-8-14-57-44m.jpg")
listentotheocean.collection = calming
listentotheocean.save

calmmorning = Artwork.new(title: "Calm morning", description: "Oil and ocean",
  price: 2500, size: "600x800", available: true)
attach_photo(calmmorning, "https://i.pinimg.com/originals/8a/dc/df/8adcdfd2ccc89a521a8e9f89dd549040.jpg")
calmmorning.collection = calming
calmmorning.save

cliffmorning = Artwork.new(title: "The cliff is waking up", description: "Calm morning on the beach",
  price: 1990, size: "600x800", available: true)
attach_photo(cliffmorning, "https://ae01.alicdn.com/kf/HTB1jM7EJVXXXXbtXXXXq6xXFXXXU/The-Cliff-Etretat-Sunset-Claude-Famous-Oil-Paintings-Reproduction-Artwork-Classic-Seascape-Sea-Beach-Pictures-on.jpg")
cliffmorning.collection = calming
cliffmorning.save

puts "Finished"
