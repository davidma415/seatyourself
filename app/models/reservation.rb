class Reservation < ApplicationRecord
  validates :date, :time, :party_size, presence: true
  validates :party_size, numericality: { only_integer: true }
  validates_numericality_of :party_size, :greater_than => 0
  belongs_to :user
  belongs_to :restaurant
end
