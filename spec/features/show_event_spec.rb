require 'rails_helper'

describe "Viewing an individual event" do
  let(:event) { create :event }

  it "Show the events' details" do
    visit event_url(event)

    expect(page).to have_text(event.name)
    expect(page).to have_text(event.starts_at)
    expect(page).to have_text(event.ends_at)
    expect(page).to have_text(event.price)
    expect(page).to have_text(event.capacity)
    expect(page).to have_text(event.description)
  end
end
