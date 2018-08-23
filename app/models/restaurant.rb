class Restaurant < ApplicationRecord
  validates :name, :opening_hour, :closing_hour, :max_capacity, :max_party_size, :min_party_size, presence: true
  validates :max_capacity, numericality: { only_integer: true }
  validates :min_party_size, numericality: { only_integer: true, greater_than: 0, less_than: :max_party_size }
  validates :max_party_size, numericality: { only_integer: true, less_than: :max_capacity, greater_than: :min_party_size}
  validates_numericality_of :max_capacity, greater_than: 0


  has_many :reservations, dependent: :destroy
  belongs_to :user

end
