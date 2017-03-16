User.destroy_all
Category.destroy_all

10.times do
  Category.create!(
    name: Faker::Hipster.word
    )
end

rock = Category.create! ({name:"Rock"})
dance = Category.create! ({name:"Dance"})
country= Category.create! ({name:"Country"})
classical= Category.create! ({name:"Classical"})
jazz= Category.create! ({name:"Jazz"})
hiphop= Category.create! ({name:"HipHop"})

user1 = User.create ( { email: "jantjarco@codaisseurup.com", password: "fakepassword"})

10.times do
  Event.create!({
    name:Faker::Book.title,
    description:Faker::Hipster.paragraph,
    location:Faker::Address.city,
    capacity: Faker::Number.between(15, 1000),
    includes_food: Faker::Boolean.boolean,
    includes_drinks: Faker::Boolean.boolean,
    starts_at: 10.days.from_now,
    ends_at: 12.days.from_now,
    active:true,
    user: user1,
    categories: [rock, dance]
  })
end
