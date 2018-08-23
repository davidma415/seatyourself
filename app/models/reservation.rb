class Reservation < ApplicationRecord
  validates :date, :time, :party_size, presence: true
  # validates_numericality_of :party_size, {greater_than: :min_party_size,less_than: :max_party_size}
  validate :date_cannot_be_in_the_past
  validate :restaurant_open
  validate :party_size_check
  validate :check_capacity

  belongs_to :user
  belongs_to :restaurant

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

  def party_size_check
    if party_size > restaurant.max_party_size || party_size < restaurant.min_party_size
      errors.add(:party_size, " is not within the range of allowable party sizes.")
    end
  end

  def check_capacity
    date_reservations = Reservation.where(date: date)
    date_counter = 0
    date_reservations.each do |res|
      date_counter += res[:party_size]
    end
    date_counter += self.party_size

    if date_counter > restaurant.max_capacity
      errors.add(:party_size, "is higher than the allowed capacity")
    end
  end

  def self.in_next_week
    Reservation.where("date > ? AND date < ? ", Date.today, 7.days.from_now)
  end

end
