class Reservation < ApplicationRecord
  validates :date, :time, :party_size, presence: true
  validates :party_size, numericality: { only_integer: true }
  belongs_to :user
  belongs_to :restaurant
end
