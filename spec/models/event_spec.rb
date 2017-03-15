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
end
