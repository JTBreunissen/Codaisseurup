require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
   it "is invalid without a name" do
     event = Event.new(name: "")
     event.valid?
     expect(event.errors).to have_key(:name)
   end

   it "is invalid without a description" do
     event = Event.new(description: "")
     event.valid?
     expect(event.errors).to have_key(:description)
   end

   it "is invalid with a description longer than 500 characters" do
     event = Event.new(description: "$"*501)
     event.valid?
     expect(event.errors).to have_key(:description)
   end
 end

 describe "#bargain?" do
   let(:bargain_event) { create :event, price: 20 }
   let(:non_bargain_event) { create :event, price: 200 }

   it "returns true if the price is lower than 30 EUR" do
     expect(bargain_event.bargain?).to eq(true)
     expect(non_bargain_event.bargain?).to eq(false)
   end
 end

 describe ".order_by_price" do
   let!(:event1) { create :event, price:10}
   let!(:event2) { create :event, price:50}
   let!(:event3) { create :event, price:100}

   it "shows array of events, sorted by price" do
     expect(Event.order_by_price).to eq([event1, event2, event3])
   end
 end

 describe "association with user" do
  let(:user) { create :user }

    it "belongs to a user" do
      event = user.events.new(description: "Too bad")

      expect(event.user).to eq(user)
    end
  end

  describe "association with category" do
    let(:event) { create :event }

    let(:category1) { create :category, name: "Rock", events: [event] }
    let(:category2) { create :category, name: "Dance", events: [event] }
    let(:category3) { create :category, name: "HipHop", events: [event] }

    it "has categories" do
      expect(event.categories).to include(category1)
      expect(event.categories).to include(category2)
      expect(event.categories).to include(category3)
    end
  end

end
