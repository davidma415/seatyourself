class Restaurant < ApplicationRecord
  validates :name, :opening_hour, :closing_hour, :max_capacity, presence: true
  validates :max_capacity, numericality: { only_integer: true }
  validates_numericality_of :max_capacity, :greater_than => 0

  has_many :reservations
  belongs_to :user

end
