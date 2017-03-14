User.destroy_all

user1 = User.create ( { email: "jantjarco@codaisseurup.com", password: "fakepassword"})

event1 = Event.create ( {name:"PartyHardy", description:"Party harder", location:"Amsterdam", capacity: 50, includes_food: false, includes_drinks: true, starts_at: 10.days.from_now, ends_at: 12.days.from_now, active:true, user: user1 })
event2 = Event.create ( {name:"LoungeDown", description:"Get mellow", location:"Utrecht", capacity: 20, includes_food: false, includes_drinks: true, starts_at: 10.days.from_now, ends_at: 12.days.from_now, active:true, user: user1 })
event2 = Event.create ( {name:"WrongStartDate", description:"Too bad", location:"Den Haag", capacity: 20, includes_food: false, includes_drinks: true, starts_at: 10.days.from_now, ends_at: 12.days.from_now, active:true, user: user1 })
