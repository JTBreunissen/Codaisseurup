class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :bookings, dependent: :destroy
end
