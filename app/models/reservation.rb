class Reservation < ApplicationRecord
  validates :date, :time, :party_size, presence: true
  validates_numericality_of :party_size, :greater_than => 0
  validate :date_cannot_be_in_the_past
  validate :restaurant_open

  def date_cannot_be_in_the_past
    if date.present? && date.past?
      errors.add(:date, "can't be in the past")
    end
  end

  def restaurant_open
    if time < restaurant.opening_hour || time > restaurant.closing_hour
      errors.add(:time, "is not when the restaurant is open.")
    end
  end
  belongs_to :user
  belongs_to :restaurant
end
