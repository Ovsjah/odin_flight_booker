class Flight < ApplicationRecord
  has_many :bookings
  has_many :passengers, through: :bookings

  belongs_to :departure, class_name: 'Airport'
  belongs_to :arrival, class_name: 'Airport'

  scope :upcoming, -> { where('date >= ?', current_time) }
  scope :search, -> (departure_id, arrival_id, seats, date) do
    where(departure_id: departure_id, arrival_id: arrival_id).where('date <= ?', date)
  end

  class << self
    def current_time
      Time.current.in_time_zone(Time.now.zone).time
    end
  end

  def departure_code
    departure.code
  end
end
