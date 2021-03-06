class Flight < ApplicationRecord
 
    has_many :flight_rides
    has_many :users, through: :flight_rides

    validates :inspection, :presence => true
    validates :fuel_cost, :presence => true
    validates :destination, :presence => true
    validates :flight_departure, :presence => true
    validates :flight_sit, :presence => true
    
   
    scope :pass_inspection, -> { where(inspection: true) }

    scope :big_flight, -> { where('flight_sit >= 5')}

end
