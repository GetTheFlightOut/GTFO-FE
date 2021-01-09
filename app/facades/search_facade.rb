class SearchFacade

  def self.get_destination_city(params)
    #DREAM DRIVING HERE, NEED FlightService CREATED
    flight_data = BackendService.flights_search(params)
    flight_data.map do |data|
      Flight.new(data)
    end
  end

  def self.get_flights(params)
    flight_data = BackendService.flights_search(params)
    flight_data[:data].map do |data|
      Flight.new(data)
    end
  end
end
