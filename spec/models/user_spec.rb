require 'rails_helper'

RSpec.describe User, type: :model do
  describe "association with event" do
    let(:user) { create :user }
    let!(:event) { create :event, user: user }

    it "has many events" do
      event1 = user.events.new(listing_name: "DanceDance")
      event2 = user.events.new(listing_name: "PartyHarder")

      expect(user.events).to include(event1)
      expect(user.events).to include(event2)
    end

    it "deletes associated events" do
      expect { user.destroy }.to change(event, :count).by(-1)
    end
  end
end
