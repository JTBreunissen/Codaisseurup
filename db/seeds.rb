User.destroy_all
Category.destroy_all


rock = Category.create ({name:"Rock"})
dance = Category.create ({name:"Dance"})
country= Category.create ({name:"Country"})
classical= Category.create ({name:"Classical"})
jazz= Category.create ({name:"Jazz"})
hiphop= Category.create ({name:"HipHop"})

user1 = User.create ( { email: "jantjarco@codaisseurup.com", password: "fakepassword"})

event1 = Event.create ( {name:"PartyHardy", description:"Party harder", location:"Amsterdam", capacity: 50, includes_food: false, includes_drinks: true, starts_at: 10.days.from_now, ends_at: 12.days.from_now, active:true, user: user1, categories: [rock, dance] })
event2 = Event.create ( {name:"LoungeDown", description:"Get mellow", location:"Utrecht", capacity: 20, includes_food: false, includes_drinks: true, starts_at: 10.days.from_now, ends_at: 12.days.from_now, active:true, user: user1, categories: [rock, classical] })
event2 = Event.create ( {name:"WrongStartDate", description:"Too bad", location:"Den Haag", capacity: 20, includes_food: false, includes_drinks: true, starts_at: 10.days.from_now, ends_at: 12.days.from_now, active:true, user: user1, categories: [country, jazz, hiphop] })
