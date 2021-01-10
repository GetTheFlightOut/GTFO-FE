class SearchFacade

  def self.get_lucky(params)
    flight_data = BackendService.flights_search(params)
    Trip.new(flight_data[:data][0])
  end


  def self.get_flights(params)
    flight_data = BackendService.flights_search(params)
    flight_data[:data].map do |data|
      Trip.new(data)
    end
  end
end
