class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, precense: true, length: {maximum: 500}
end
