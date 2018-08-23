class Reservation < ApplicationRecord
  validates :date, :time, :party_size, presence: true
  validates_numericality_of :party_size, :greater_than => 0
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if date.present? && date.past?
      errors.add(:date, "can't be in the past")
    end
  end

  belongs_to :user
  belongs_to :restaurant
end
