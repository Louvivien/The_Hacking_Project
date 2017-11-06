class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :duration, presence: true, numericality: { only_integer: true }
  validates :departure_date, presence: true
  validates :departure_airport, presence: true
  validates :arrival_airport, presence: true

  def self.search(from, to)
    if from > 0 && to > 0
      where('departure_airport_id = ? and arrival_airport_id = ?', from, to)
    elsif from > 0
      where('departure_airport_id = ?', from)
    elsif to > 0
      where('arrival_airport_id = ?', to)
    end
  end
end
