class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, precense: true, length: {maximum: 500}
  validates: :starts_at, precense: true
  validates: :ends_at, precense: true
  validates_date: :ends_at :on_or_before => :start_at, :on_or_before_message => "End date must be at least 1 day after start date"

end
