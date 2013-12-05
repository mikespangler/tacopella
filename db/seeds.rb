# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tween = Challenge.create(name: "Teeny Boppers", difficulty: 1)
hiphop = Challenge.create(name: "90s Hip-Hop", difficulty: 2)
bieber = Challenge.create(name: "Bieber Fever", difficulty: 2)
whitney = Challenge.create(name: "Strictly Whitney", difficulty: 2)
boybands = Challenge.create(name: "Boy Bands", difficulty: 1)
newstuff = Challenge.create(name: "New Stuff", difficulty: 1)

tween.songs.create(play_key: "t3423904", name: "Womanizer", challenge_id: 1)
tween.songs.create(play_key: "t8410505", name: "Baby One More Time", challenge_id: 1)
tween.songs.create(play_key: "t2951331", name: "Candy", challenge_id: 1)
tween.songs.create(play_key: "t1131582", name: "What A Girl Wants", challenge_id: 1)
tween.songs.create(play_key: "t2919990", name: "Genie in a Bottle", challenge_id: 1)

hiphop.songs.create(play_key: "t23546535", name: "Can I Get A", challenge_id: 2)
hiphop.songs.create(play_key: "t21188915", name: "This Is Why I'm Hot", challenge_id: 2)

bieber.songs.create(play_key: "t21948671", name: "Boyfriend", challenge_id: 3)
bieber.songs.create(play_key: "t15764643", name: "Baby", challenge_id: 3)

whitney.songs.create(play_key: "t3190763", name: "Love Will Save The Day", challenge_id: 4)
whitney.songs.create(play_key: "t17187007", name: "The Greatest Love of All", challenge_id: 4)

boybands.songs.create(play_key: "t11106627", name: "Everybody", challenge_id: 5)
boybands.songs.create(play_key: "t2901696", name: "I Want It That Way", challenge_id: 5)

newstuff.songs.create(play_key: "t32502287", name: "We Can't Stop", challenge_id: 6)
newstuff.songs.create(play_key: "t23347791", name: "22", challenge_id: 6)